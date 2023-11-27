module fortran_code

implicit none

contains 

subroutine fast_square(result, x)

    integer, parameter          :: dp = SELECTED_REAL_KIND(14, 200)
    real(kind=dp), intent(out)           :: result
    real(kind=dp), intent(in)            :: x

    result = x**2

end subroutine fast_square

end module fortran_code