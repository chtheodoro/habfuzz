subroutine fruler
use fdeclarations

implicit none
allocate(pmatrix(nn,w+2))
allocate(p22matrix(nn,w-2))
allocate(p11matrix(nn,w,n))
pmatrix(:,:)=0
p22matrix(:,:)=0

do i=1,nn !For the nn combinations of the amatrix
do j=1,ii !And for the  samples
if ((amatrix(i,1) .eq. cmatrix(j,1)) .and. (amatrix(i,2) .eq. cmatrix(j,2)) &
.and. (amatrix(i,3) .eq. cmatrix(j,3)) .and. (amatrix(i,4) .eq. cmatrix(j,4))) then !If any row of the class matrix equals a row in the amatrix
if (cmatrix(j,5) .eq. 5) then !Then check the suitability class and 
pmatrix(i,1)=pmatrix(i,1)+0.9
pmatrix(i,w+2)=pmatrix(i,w+2)+1
p11matrix(i,1,j)=0.9 !Make a new matrix with the suitabilities at each column
else if (cmatrix(j,5) .eq. 4) then
pmatrix(i,2)=pmatrix(i,2)+0.7
pmatrix(i,w+2)=pmatrix(i,w+2)+1
p11matrix(i,2,j)=0.7 !And assign 1 to the relevant suitability column
else if (cmatrix(j,5) .eq. 3) then
pmatrix(i,3)=pmatrix(i,3)+0.5
pmatrix(i,w+2)=pmatrix(i,w+2)+1
p11matrix(i,3,j)=0.5
else if (cmatrix(j,5) .eq. 2) then
pmatrix(i,4)=pmatrix(i,4)+0.3
pmatrix(i,w+2)=pmatrix(i,w+2)+1
p11matrix(i,4,j)=0.3
else if (cmatrix(j,5) .eq. 1) then
pmatrix(i,5)=pmatrix(i,5)+0.1
pmatrix(i,w+2)=pmatrix(i,w+2)+1
p11matrix(i,5,j)=0.1
end if
end if
end do
end do

do i=1,nn
pmatrix(i,w+1)=sum(pmatrix(i,1:w)) !Then attach an extra column where all values will be sumed
end do

do i=1,nn
do j=1,z
if (pmatrix(i,w+1)>0) then
p22matrix(i,1)=pmatrix(i,w+1)/pmatrix(i,w+2)
p22matrix(i,2)=(minval(p11matrix(i,1:w,:), mask=(p11matrix(i,1:w,:))>0))
p22matrix(i,3)=(maxval(p11matrix(i,1:w,:), mask=(p11matrix(i,1:w,:))>0))
else
p22matrix(i,:)=0
end if
end do
end do

end subroutine fruler
