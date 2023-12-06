module types

implicit none

integer, parameter :: dp = selected_real_kind(14,200) ! double precision

real(dp) :: r_dp = 1.0_dp

end module

module fortran_code

implicit none

contains 

subroutine fast_square(result, x)

    use types
    real(kind=dp), intent(out)           :: result
    real(kind=dp), intent(in)            :: x

    result = x**2

end subroutine fast_square

end module fortran_code