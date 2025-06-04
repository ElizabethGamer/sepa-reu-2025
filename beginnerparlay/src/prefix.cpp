#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include "prefix.h"

int scanup(parlay::sequence<int>& A, parlay::sequence<int>& M, int start, int end){
    int left, right;

    if (end - start == 1){
        return A[start];
    } else {
        parlay::parallel_do(
        [&]() {left = scanup(A, M, start, start + (end - start) / 2);},
        [&]() {right = scanup(A, M, start + (end - start) / 2, end);}

        );

        M[start + (end - start) / 2 - 1] = left;
        return left + right;
    }
}

void scandown(parlay::sequence<int>& A, parlay::sequence<int>& M, int start, int end, int s){
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

int prefix(parlay::sequence<int>& A){
    int size = A.size();
    parlay::sequence<int> M(size);
    int total = scanup(A, M, 0, size);
    scandown(A, M, 0, 100, 0);

    return total;
}