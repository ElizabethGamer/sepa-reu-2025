#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>

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

int main(int argc, char* argv[]){
    // generate input
    parlay::random_generator gen;
    std::uniform_int_distribution<int> dis(0, 100);
    auto result = parlay::tabulate(100, [&](size_t i) {
        auto r = gen[i];
        return dis(r);
    });


    // filter
    parlay::sequence<int> evens = filter(result, [](int a) {return a%2 == 0;});

    // prefix sum
    int total = prefix(result);

    // reduction
    auto binop = parlay::plus<int>();
    int reduced = reduction(result, 0, 100, binop);

    return 0;
}