#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include "prefix.h"
#include "filter.h"

parlay::sequence<int> filter(parlay::sequence<int>& arr, std::function<bool(int)> f){
    int size = arr.size();
    parlay::sequence<bool> flags(size);
    parlay::sequence<int> flags_copy(size);

    parlay::parallel_for(0, size, [&](size_t i) {
        flags[i] = f(arr[i]);
        flags_copy[i] = int(f(arr[i]));
    });

    int total = prefix(flags_copy);
    parlay::sequence<int> result(total);

    parlay::parallel_for(0, total, [&](size_t i){
        if (flags[i]){
            result[flags_copy[i]] = arr[i];
        }
    });

    return result;
}