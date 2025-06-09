#pragma once

#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/monoid.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>

template <typename T, typename Func>
T reduction(typename parlay::sequence<T> array, int start, int end, Func binop){
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
        };

        return sum;
    };
};