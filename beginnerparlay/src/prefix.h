#ifndef PREFIX_H_
#define PREFIX_H_

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include <parlay/monoid.h>

template<typename T, typename Func>
T scanup(parlay::sequence<T>& A, parlay::sequence<T>& M, int start, int end, Func f){
    T left, right;

    if (end - start == 1){
        return A[start];
    } else {
        parlay::parallel_do(
        [&]() {left = scanup(A, M, start, start + (end - start) / 2, f);},
        [&]() {right = scanup(A, M, start + (end - start) / 2, end, f);}
        );

        M[start + (end - start) / 2 - 1] = left;
        return f(left, right);
    }
}

template<typename T>
void scandown(parlay::sequence<T>& A, parlay::sequence<T>& M, int start, int end, int s){
    if (end - start == 1){
        A[start] = s;
    } else {
        int mid = start + (end - start) / 2;
        parlay::parallel_do(
            [&]() {scandown(A, M, start, mid, s);},
            [&]() {scandown(A, M, mid, end, M[mid-1] + s);}
        );
    }
}

template<typename T, typename Func>
int prefix(parlay::sequence<T>& A, Func f){
    int size = A.size();
    parlay::sequence<T> M(size);
    T total = scanup(A, M, 0, size, f);
    scandown(A, M, 0, 100, 0);

    return total;
}

#endif