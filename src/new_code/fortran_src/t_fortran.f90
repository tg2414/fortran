module types

implicit none

integer, parameter :: dp = selected_real_kind(14,200) ! double precision

real(dp) :: r_dp = 1.0_dp

end module

module fortran_code

use omp_lib
implicit none

contains 

subroutine fast_square(result, n_threads, x)

    use types
    real(kind=dp), intent(out)           :: result
    real(kind=dp), intent(in)            :: x
    integer, intent(out)                 :: n_threads

    result = x**2
    ! print*, result

    n_threads = omp_get_num_threads()

end subroutine fast_square

end module fortran_code
