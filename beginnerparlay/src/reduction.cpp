#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/monoid.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include "reduction.h"

template <typename T, typename BinOp>
T reduction(typename parlay::sequence<T> array, int start, int end, BinOp binop){
    if (start - end > 256) {
        T left, right;
        parlay::parallel_do(
            [&]() {left = reduction(array, start, start + (end - start) / 2, binop);},
            [&]() {right = reduction(array, start + (end - start) / 2, end, binop);}
        );

        return binop(left, right);
    } else {
        T sum = binop.identity;
        while (start < end){
            sum = binop(sum, array[start]);
            start += 1;
        }

        return sum;
    }
};