subroutine randomizer
!This subroutine creates a matrix (n,1) with n the size of traindata matrix. It fills this matrix with numbers from 1 to n and
!shuffles randomly. This matrix is the a(i).
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

!Sorry, I am just an ecologist and I found this way to create the various fold for the process 
a1(1:n)=a(1:n)

a1(n+1:2*n-z)=a(1+z:n)
a1(2*n-(z-1):2*n)=a(1:z)

a1(2*n+1:3*n-2*z)=a(1+2*z:n)
a1(3*n-(2*z-1):3*n)=a(1:2*z)

a1(3*n+1:4*n-3*z)=a(1+3*z:n)
a1(4*n-(3*z-1):4*n)=a(1:3*z)

a1(4*n+1:5*n-4*z)=a(1+4*z:n)
a1(5*n-(4*z-1):5*n)=a(1:4*z)

a1(5*n+1:6*n-5*z)=a(1+5*z:n)
a1(6*n-(5*z-1):6*n)=a(1:5*z)

a1(6*n+1:7*n-6*z)=a(1+6*z:n)
a1(7*n-(6*z-1):7*n)=a(1:6*z)

a1(7*n+1:8*n-7*z)=a(1+7*z:n)
a1(8*n-(7*z-1):8*n)=a(1:7*z)

a1(8*n+1:9*n-8*z)=a(1+8*z:n)
a1(9*n-(8*z-1):9*n)=a(1:8*z)

a1(9*n+1:10*n-9*z)=a(1+9*z:n)
a1(10*n-(9*z-1):10*n)=a(1:9*z)

!do i=1,n*10
!write(*,10) (a1(i))
!end do
!write(*,*) ' '
!read(*,*) 
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
