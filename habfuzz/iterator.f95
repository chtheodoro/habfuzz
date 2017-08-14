subroutine iterator
use fdeclarations

implicit none
j=90*n
if (mod(j,100)==0) then
ii=j/100
else
ii=int(j)/100
end if
z=n-ii

allocate(dmatrix(ii,w))
allocate(ematrix(z,w))

do i=1,ii
dmatrix(i,:)=matrix(a(i),:)
end do

do i=1,z
ematrix(i,:)=matrix(a(i+ii),:)
co1matrix(i,zz)=ematrix(i,5)
end do

!do f=1,ii
!write(*,10) (dmatrix(f,k), k=1,w)
!end do
!read(*,*)


!do f=1,z
!write(*,10) (ematrix(f,k), k=1,w)
!end do
!10 format (8f7.3)
!read(*,*)
end subroutine iterator
