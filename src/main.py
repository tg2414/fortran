#!/usr/bin/env python3
import numpy as np
import fortran_code

def square(x):
    result = x**2
    return result

def numpy_square(x):
    result = np.square(x)
    return result

def fortran_square(x):
    result = fortran_code.fortra_code.fast_square(x)
    return result

if __name__=="__main__":
    pass