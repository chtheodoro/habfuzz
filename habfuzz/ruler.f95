!This subroutine calculates the Bayesian joint probability from the input data
subroutine ruler
use fdeclarations

implicit none
allocate(p1matrix(nn,w+1))
allocate(p2matrix(nn,w))
p1matrix(:,:)=0
p2matrix(:,:)=0

do i=1,nn !For the nn combinations of the amatrix
do j=1,ii !And for the n samples
if ((amatrix(i,1) .eq. cmatrix(j,1)) .and. (amatrix(i,2) .eq. cmatrix(j,2)) &
.and. (amatrix(i,3) .eq. cmatrix(j,3)) .and. (amatrix(i,4) .eq. cmatrix(j,4))) then !If any row of the class matrix equals a row in the amatrix
if (cmatrix(j,5) .eq. 5) then !Then check the suitability class and 
p1matrix(i,1)=p1matrix(i,1)+1 !Make a new matrix with the suitabilities at each column
else if (cmatrix(j,5) .eq. 4) then
p1matrix(i,2)=p1matrix(i,2)+1 !And assign 1 to the relevant suitability column
else if (cmatrix(j,5) .eq. 3) then
p1matrix(i,3)=p1matrix(i,3)+1
else if (cmatrix(j,5) .eq. 2) then
p1matrix(i,4)=p1matrix(i,4)+1
else if (cmatrix(j,5) .eq. 1) then
p1matrix(i,5)=p1matrix(i,5)+1
end if
end if
end do
end do

do i=1,nn
p1matrix(i,w+1)=sum(p1matrix(i,1:w)) !Then attach an extra column where all 1 will be sumed
end do

do i=1,nn
do j=1,w
if (p1matrix(i,j)>0 .and. p1matrix(i,w+1)>0) then
p2matrix(i,j)=p1matrix(i,j)/p1matrix(i,w+1) !And now create another matrix where all the probabilities will be stored
else !If a combination gets 1 and the suitability s also 1 then the probability is the division between P for a class by P all classes
p2matrix(i,j)=0 !If not then P = 0
end if
end do
end do

end subroutine ruler
