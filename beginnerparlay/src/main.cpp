#include <iostream>
#include <string>
#include <chrono>

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include <parlay/monoid.h>

#include "reduction.h"
#include "prefix.h"
#include "filter.h"

int main(int argc, char* argv[]){
    // generate input
    int n = 100000;
    parlay::random_generator gen(189);
    std::uniform_int_distribution<int> dis(0, n);
    auto result = parlay::tabulate(n, [&](size_t i) {
        auto r = gen[i];
        return dis(r);
    });

    auto start = std::chrono::high_resolution_clock::now();
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed;

    auto binop = parlay::plus<int>();

    // filter
    start = std::chrono::high_resolution_clock::now();
    parlay::sequence<int> evens = filter(result, [](int a) {return a%2 == 0;});
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "My filter: " << elapsed.count() << "\n";

    start = std::chrono::high_resolution_clock::now();
    parlay::sequence<int> evensp = parlay::filter(result, [](int a) {return a%2 == 0;});
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "Parlay's filter: " << elapsed.count() << "\n";

    // prefix sum
    start = std::chrono::high_resolution_clock::now();
    auto total = prefix(result, binop);
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "My prefix: " << elapsed.count() << "\n";

    start = std::chrono::high_resolution_clock::now();
    auto totalp = parlay::scan(result, binop);
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "Parlay's prefix: " << elapsed.count() << "\n";

    ips4o::parallel::sort(begin, end[, comparator]);

    // reduction
    start = std::chrono::high_resolution_clock::now();
    int reduced = reduction(result, 0, 100, binop);
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "My reduction: " << elapsed.count() << "\n";

    start = std::chrono::high_resolution_clock::now();
    int reducedp = parlay::reduce(result, binop);
    end = std::chrono::high_resolution_clock::now();
    elapsed = end - start;
    std::cout << "Parlay's reduction: " << elapsed.count() << "\n";

    return 0;
}