#!/usr/bin/env python3
import numpy as np
import fortran_code_sub_directory.fortran_code_bundle as fc
import importlib.resources as resources
from pathlib import Path

DATADIR = Path.joinpath(resources.files("python_code_sub_directory"), "data")

def square(x):
    result = x**2
    return result

def numpy_square(x):
    result = np.square(x)
    return result

def fortran_square(x):
    result = fc.fortran_code.fast_square(x)
    return result

def fortran_cube(x):
    result = fc.fortran_code2.fast_cube(x)
    return result

def test_data_files():
    data = np.loadtxt(DATADIR.joinpath("data.dat"))
    print(data)

if __name__=="__main__":
    print(square(2.0))
    print(numpy_square(2.0))
    print(fortran_square(2.0))
