from libc.stdlib cimport malloc, free 
from cfoo cimport SumResult
from cfoo cimport array_square as c_arr_square
from cfoo cimport array_sum as c_arr_sum
import numpy as np 
cimport numpy as np
np.import_array()


# wrapper of c-struct SumResult
# 如果 SumResult 是比较大的结构体，则需要管理所有权
# 一个比较建议的模式是，使用python class 管理该结构体的指针
# 在 __dealloc__ 中释放内存，那么该结构体的生命周期会和该 python class 绑定在一起
# 会被 python 的 gc 回收
cdef class SumResultW:

    cdef SumResult c_res  

    def __init__(self, res) -> None:
        self.c_res.result = res 

    @property
    def result(self) -> float:
        return self.c_res.result

    @staticmethod
    cdef SumResultW from_c(SumResult res):
        cdef SumResultW obj
        obj = SumResultW.__new__(SumResultW) 
        obj.c_res = res 
        return obj
    

def array_square(double[:] arr):

    # np.double_t 和 np.double 的区别
    cdef np.ndarray[np.double_t, ndim=1] res
    cdef int length = arr.shape[0]

    # 此处 dtype 使用 np.double_t 会编译失败
    res = np.zeros([length], dtype=np.double)
    c_arr_square(&arr[0], &res[0], length)

    return res 


def array_sum(double[:] arr):

    cdef SumResult res
    cdef int length = arr.shape[0]

    res = c_arr_sum(&arr[0], length)
    return SumResultW.from_c(res)
