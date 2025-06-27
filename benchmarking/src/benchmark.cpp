#include <iostream>
#include <fstream>
#include <utility>
#include "parlay/primitives.h"
#include <parlay/parallel.h>
#include <parlay/sequence.h>
#include <parlay/generator.h>
#include "parlay/random.h"

#include <ips4o.hpp>
#include <cpp11sort.h>

#include "hwy/contrib/sort/vqsort-inl.h"
#include "hwy/contrib/sort/vqsort.h"
#include "hwy/highway.h"

#include "pdqsort.h"

namespace hn = hwy::HWY_NAMESPACE;

using namespace std;
using namespace parlay;
using std::pair;

constexpr int NUM_ROUNDS = 5;
size_t n = 1e9;

template <typename T>
struct heap_tree {
 private:
  const long size;
  parlay::sequence<T> tree;
  const long levels;

  // converts from sorted sequence into a "heap indexed" tree
  void to_tree(const parlay::sequence<T>& In,
               long root, long l, long r) {
    size_t n = r - l;
    size_t m = l + n / 2;
    tree[root] = In[m];
    if (n == 1) return;
    to_tree(In, 2 * root + 1, l, m);
    to_tree(In, 2 * root + 2, m + 1, r);
  }
 public:
  // constructor
  heap_tree(const parlay::sequence<T>& keys) :
      size(keys.size()), tree(parlay::sequence<T>(size)),
      levels(parlay::log2_up(keys.size()+1)-1) {
    to_tree(keys, 0, 0, size);}

  // finds a key in the "heap indexed" tree
  template <typename Less>
  inline int find(const T& key, const Less& less) {
    long j = 0;
    for (int k = 0; k < levels; k++) {
      j = 1 + 2 * j + less(tree[j],key);
    }
    j = 1 + 2 * j + !less(key,tree[j]);
    return j - size;
  }
};

template <typename Range, typename Less>
void sample_sort_(Range in, Range out, Less less, int level=1) {
  long n = in.size();

  // for the base case (small or recursion level greater than 2) use std::sort
  long cutoff = 256;
  if (n <= cutoff || level > 2) {
    parlay::copy(in, out);
    pdqsort(out.begin(), out.end());
    return;
  }

  // number of bits in bucket count (e.g. 8 would mean 256 buckets)
  int bits = std::min<long>(8, parlay::log2_up(n)-parlay::log2_up(cutoff)+1);
  long num_buckets = 1 << bits;

  // over-sampling ratio: keeps the buckets more balanced
  int over_ratio = 8;

  // create an over sample and sort it using std:sort
  parlay::random_generator gen;
  std::uniform_int_distribution<long> dis(0, n-1);
  auto oversample = parlay::tabulate(num_buckets * over_ratio, [&] (long i) {
    auto r = gen[i];
    return in[dis(r)];});
  std::sort(oversample.begin(), oversample.end());

  // sub sample to pick final pivots (num_buckets - 1 of them)
  auto pivots = parlay::tabulate(num_buckets-1, [&] (long i) {
    return oversample[(i+1)*over_ratio];});

  // put pivots into efficient search tree and find buckets id for the input keys
  heap_tree ss(pivots);
  auto bucket_ids = parlay::tabulate(n, [&] (long i) -> unsigned char {
    return ss.find(in[i], less);});

  // sort into the buckets
  auto [keys,offsets] = parlay::internal::count_sort(in, bucket_ids, num_buckets);

  // now recursively sort each bucket
  parlay::parallel_for(0, num_buckets, [&, &keys = keys, &offsets = offsets] (long i) {
    long first = offsets[i];
    long last = offsets[i+1];
    if (last-first == 0) return; // empty
    // are all equal, then can copy and quit
    if (i == 0 || i == num_buckets - 1 || less(pivots[i - 1], pivots[i]))
      sample_sort_(keys.cut(first,last), out.cut(first,last), less, level+1);
    else parlay::copy(keys.cut(first,last), out.cut(first,last));
  }, 1);
}

//  A wraper that calls sample_sort_
template <typename Range, typename Less = std::less<>>
void sample_sort(Range& in, Less less = {}) {
  auto ins = parlay::make_slice(in);
  sample_sort_(ins, ins, less);
}

template<typename T, typename GetKey>
double test(const sequence<T> &in, const GetKey &g) {
  std::cout << "test_name: cpp11" << std::endl;
  double total_time = 0;
  for (int i = 0; i <= NUM_ROUNDS; i++) {
    auto seq = in;
    internal::timer t;
    sample_sort(seq);
    t.stop();

    if (i == 0) {
      printf("Warmup: %f\n", t.total_time());
    } else {
      printf("Round %d: %f\n", i, t.total_time());
      total_time += t.total_time();
    }
  }
  double avg = total_time / NUM_ROUNDS;
  printf("Average: %f\n", avg);
  return avg;
}

template<typename T, typename GetKey>
void run_all(const sequence<T> &seq, const GetKey &g) {
    vector<double> times;
    times.push_back(test(seq, g));
    printf("\n");
    ofstream ofs("results.tsv", ios::app);
  for (auto t : times) {
    ofs << t << '\t';
  }
  ofs << '\n';
  ofs.close();
}

template<class T>
void run_rep_dist() {
  // uniform distribution
  vector<size_t> num_keys{10000000, 1000};
  for (auto v : num_keys) {
    auto seq = uniform_pairs_generator<T>(v);
    run_all(
        seq, [](const pair<T, T> &a) { return a.first; });
  }

  // exponential distribution
  vector<double> lambda{0.00002, 0.00007};
  for (auto v : lambda) {
    auto seq = exponential_pairs_generator<T>(v);
    run_all(
        seq, [](const pair<T, T> &a) { return a.first; });
  }

  // zipfian distribution
  vector<double> s{0.8, 1.2};
  for (auto v : s) {
    auto seq = zipfian_pairs_generator<T>(v);
    run_all(
        seq, [](const pair<T, T> &a) { return a.first; });
  }
}


template<class T>
void run_all_sizes() {
  vector<size_t> sizes{1'000'000, 10'000'000, 100'000'000, 1'000'000'000, 2'000'000'000, 4'000'000'000}; //1'000'000, 10'000'000, 100'000'000, 1'000'000'000,
  for (auto input_size : sizes) {
    n = input_size;
    printf("size: %ld\n", n);
    run_rep_dist<T>();
  }
}

int main() {
    /*size_t n = 1000000;
    auto seq = uniform_pairs_generator<uint32_t>(n);
    test(seq, [](const pair<uint32_t, uint32_t> &a) { return a.first; });*/
    run_all_sizes<uint32_t>();
    return 0;
}
