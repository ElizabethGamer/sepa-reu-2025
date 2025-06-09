#include <iostream>
#include <fstream>
#include <utility>
#include "parlay/primitives.h"
#include <parlay/parallel.h>
#include <parlay/sequence.h>
#include <parlay/generator.h>
#include "parlay/random.h"
using namespace std;
using namespace parlay;
using std::pair;

constexpr int NUM_ROUNDS = 5;
size_t n = 1e9;

template<typename T, typename GetKey>
double test(const sequence<T> &in, const GetKey &g) {
  std::cout << "test_name: stable integer sort" << std::endl;
  double total_time = 0;
  for (int i = 0; i <= NUM_ROUNDS; i++) {
    auto seq = in;
    internal::timer t;
    /*switch (id) {
      case 0: integer_sort_inplace2(make_slice(seq), g); break;
      case 1: std::sort(seq.begin(), seq.end(), [&](const T &a, const T &b) { return g(a) < g(b); }); break;
      default: assert(0);
    }*/
    parlay::stable_integer_sort_inplace(seq, g);
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
  vector<size_t> sizes{1000000,   10'000'000,   100'000'000,   1'000'000'000};
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
