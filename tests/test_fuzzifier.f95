module test_fuzzifier
use fdeclarations
use fruit

implicit none

contains
subroutine sum_of_fuzzified_values_should_be_1 
real :: totalu, totald, totalsub
real :: ref=1

open (unit=99, file='../tests_input/depths.txt', status='old', action='read')
open (unit=89, file='../tests_input/velocities.txt', status='old', action='read')
open (unit=79, file='../tests_input/substrates.txt', status='old', action='read')
read(99, *) n
read(89, *) n
read(79, *) n
allocate(u(n))
allocate(d(n))
allocate(sub(n))

call fuzzifier
do i=1,n
totalu=uvl(i)+ul(i)+um(i)+uh(i)+uvh(i)
call assert_equals(ref, totalu)
end do

do i=1,n
totald=dvs(i)+ds(i)+dm(i)+dd(i)+dvd(i)
call assert_equals(ref, totald)
end do

do i=1,n
totalsub=bld(i)+ls(i)+ss(i)+lg(i)+mg(i)+fg(i)+sand(i)+silt(i)
call assert_equals(ref, totalsub)
end do

end subroutine sum_of_fuzzified_values_should_be_1
end module test_fuzzifier
 

