#pragma once

#include <cmath>
#include <cstddef>

#include <algorithm>
#include <type_traits>
#include <utility>

#include "parlay/delayed_sequence.h"
#include "parlay/monoid.h"
#include "parlay/parallel.h"
#include "parlay/range.h"
#include "parlay/sequence.h"
#include "parlay/slice.h"
#include "parlay/utilities.h"

template <typename Seq, typename Monoid>
auto reduce(Seq const &A, Monoid&& m, flags fl = no_flag) {
  static_assert(is_random_access_range_v<Seq>);
  static_assert(is_monoid_for_v<Monoid, range_reference_type_t<Seq>>);
  using T = monoid_value_type_t<Monoid>;
  size_t n = A.size();
  size_t mid = std::ceil(n/2);

  if (l == 0) return m.identity;
  if (l == 1) {
    return A[0];
  }

  parlay::par_do(
    {[&]() {A[0] = reduce(make_slice(A).cut(0, mid), m);},
    [&]() {A[1] = reduce(make_slice(A).cut(mid, n), m);}}
  );

  T r = m(std::move(A[0]), std::move(A[1]));
  return r;
}

template <typename Seq, typename Monoid>
auto parlay_reduce(Seq const &A, Monoid&& m, flags fl = no_flag) {
  static_assert(is_random_access_range_v<Seq>);
  static_assert(is_monoid_for_v<Monoid, range_reference_type_t<Seq>>);
  using T = monoid_value_type_t<Monoid>;
  size_t n = A.size();
  size_t block_size = (std::max)(_block_size, 4 * static_cast<size_t>(std::ceil(std::sqrt(n))));
  size_t l = num_blocks(n, block_size);
  if (l == 0) return m.identity;
  if (l == 1 || (fl & fl_sequential)) {
    return reduce_serial(A, m);
  }
  auto sums = parlay::sequence<T>::uninitialized(l);
  sliced_for(n, block_size, [&](size_t i, size_t s, size_t e) {
    assign_uninitialized(sums[i], reduce_serial(make_slice(A).cut(s, e), m));
  });
  T r = internal::reduce(sums, m);
  return r;
}