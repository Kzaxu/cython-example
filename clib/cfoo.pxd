cdef extern from "foo.h":

    ctypedef struct SumResult:
        double result 

    void array_square(double *arr_in, double *arr_out, int length)

    SumResult array_sum(double *arr, int length)
    