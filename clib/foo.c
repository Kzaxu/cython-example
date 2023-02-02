#include "foo.h"


void array_square
(double* arr_in, double* arr_out, int length) {
    for (int i = 0; i < length; ++i) {
        arr_out[i] = arr_in[i] * arr_in[i];
    }
}

SumResult array_sum(double* arr, int length) {
    double res = 0;
    for (int i = 0; i < length; ++i) {
        res += arr[i];
    }
    return (SumResult){res};
}

