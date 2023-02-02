from libc.stdlib cimport malloc, free 
from cfoo cimport SumResult
from cfoo cimport array_square as c_arr_square
from cfoo cimport array_sum as c_arr_sum
import numpy as np 
cimport numpy as np
np.import_array()


def array_square(double[:] arr):

    # np.double_t 和 np.double 的区别
    cdef np.ndarray[np.double_t, ndim=1] res
    cdef int length = arr.shape[0]

    # 此处使用 np.double_t 会编译失败
    res = np.zeros([length], dtype=np.double)
    c_arr_square(&arr[0], &res[0], length)

    return res 


def array_sum(double[:] arr):
    cdef SumResult res
    cdef int length = arr.shape[0]
    res = c_arr_sum(&arr[0], length)
    return res