#ifndef PREFIX_H_
#define PREFIX_H_

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>

int prefix(parlay::sequence<int>& A);
int scanup(parlay::sequence<int>& A, parlay::sequence<int>& M, int start, int end);
void scandown(parlay::sequence<int>& A, parlay::sequence<int>& M, int start, int end, int s);

#endif