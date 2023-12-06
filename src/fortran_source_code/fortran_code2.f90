module types2

implicit none

integer, parameter :: dp = selected_real_kind(14,200) ! double precision

real(dp) :: r_dp = 1.0_dp

end module types2

module fortran_code2

implicit none

contains 

subroutine fast_cube(result, x)

    use types2
    real(kind=dp), intent(out)           :: result
    real(kind=dp), intent(in)            :: x

    result = x**3

end subroutine fast_cube

end module fortran_code2
