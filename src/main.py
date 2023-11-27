#!/usr/bin/env python3
import numpy as np
import test_meson.fortran_code as fc

def square(x):
    result = x**2
    return result

def numpy_square(x):
    result = np.square(x)
    return result

def fortran_square(x):
    result = fc.fortran_code.fast_square(x)
    return result

if __name__=="__main__":
    print(square(2.0))
    print(numpy_square(2.0))
    print(fortran_square(2.0))