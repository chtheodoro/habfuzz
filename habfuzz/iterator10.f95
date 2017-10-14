subroutine iterator10
use fdeclarations

implicit none

j=90*n
if (mod(j,100)==0) then
ii=j/100
else
ii=int(j)/100
end if
z=n-ii
!fold=z
allocate(dmatrix(ii,w))
allocate(ematrix(z,w))

v=1
do i=zz*n-(n-1),zz*n-z
dmatrix(i-i+v,:)=matrix(a1(i),:)
v=v+1
end do

v=1
do i=zz*n-z+1,zz*n
ematrix(i-i+v,:)=matrix(a1(i),:)
v=v+1
end do

do i=1,z
co1matrix(i,zz)=ematrix(i,5)
end do

!open(69, file='dmatrix.txt', action='write', status='replace')!!!!!!!!!!!
!write(69,*) 'dmatrix'
!do f=1,ii
!write(69,10) (dmatrix(f,k), k=1,w)
!end do

!write(69,*) 'ematrix'
!do fff=1,z
!write(69,10) (ematrix(fff,k), k=1,w)
!end do

!10 format (8f7.3)

end subroutine iterator10
