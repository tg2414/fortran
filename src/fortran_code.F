module fortran_code

implicit none

contains 

subroutine fast_square(x, result)

    real, intent(in)            :: x
    real, intent(out)           :: result

    result = x**2

end subroutine fast_square

end module fortran_code