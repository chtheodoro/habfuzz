subroutine randomizer
use fdeclarations

implicit none

allocate(imatrix(n,1))
allocate(a(n))
allocate(bins(n))
allocate(iimatrix(n))
a(:)=0
bins(:)=0

iimatrix = (/ (k, k=1,n) /)
imatrix=reshape((iimatrix), (shape(imatrix)))
call init_random_seed()
do i = 1,n
a=imatrix(:,1)
call shuffle(a)
where (a == imatrix(:,1)) bins = bins + 1  ! skew tester
end do

!do i=1,n
!write(*,10) (a(i))
!end do
!write(*,*) ' '

!10 format(8I7)
contains

subroutine init_random_seed()
integer :: i, n, clock
integer, dimension(:), allocatable :: seed
          
call random_seed(size = n)
allocate(seed(n))
          
call system_clock(count=clock)
          
seed = clock + 37 * (/ (i - 1, i = 1, n) /)
call random_seed(put = seed)
          
deallocate(seed)
end subroutine

subroutine shuffle(a)
integer, intent(inout) :: a(:)
integer :: i, randpos, temp
real :: r

do i = size(a), 2, -1
call random_number(r)
randpos = int(r * i) + 1
temp = a(randpos)
a(randpos) = a(i)
a(i) = temp
end do
 
end subroutine
end subroutine randomizer
