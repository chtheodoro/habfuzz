subroutine rules1
use fdeclarations

implicit none
mmatrix(:,:,:)=0

do j=1,nn
if (scenario==1) then
if (p22matrix(j,1)>0 .and. p22matrix(j,1)<=0.2) then
mmatrix(j,5,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,1)>0.2 .and. p22matrix(j,1)<=0.4) then
mmatrix(j,4,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,1)>0.4 .and. p22matrix(j,1)<=0.6) then
mmatrix(j,3,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,1)>0.6 .and. p22matrix(j,1)<=0.8) then
mmatrix(j,2,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,1)>0.8 .and. p22matrix(j,1)<=1) then
mmatrix(j,1,i)=minval(fmatrix(j,1:w-1,i))
end if

else if (scenario==2) then
if (p22matrix(j,2)>0 .and. p22matrix(j,2)<=0.2) then
mmatrix(j,5,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,2)>0.2 .and. p22matrix(j,2)<=0.4) then
mmatrix(j,4,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,2)>0.4 .and. p22matrix(j,2)<=0.6) then
mmatrix(j,3,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,2)>0.6 .and. p22matrix(j,2)<=0.8) then
mmatrix(j,2,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,2)>0.8 .and. p22matrix(j,2)<=1) then
mmatrix(j,1,i)=minval(fmatrix(j,1:w-1,i))
end if

else if (scenario==3) then
if (p22matrix(j,3)>0 .and. p22matrix(j,3)<=0.2) then
mmatrix(j,5,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,3)>0.2 .and. p22matrix(j,3)<=0.4) then
mmatrix(j,4,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,3)>0.4 .and. p22matrix(j,3)<=0.6) then
mmatrix(j,3,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,3)>0.6 .and. p22matrix(j,3)<=0.8) then
mmatrix(j,2,i)=minval(fmatrix(j,1:w-1,i))
else if (p22matrix(j,3)>0.8 .and. p22matrix(j,3)<=1) then
mmatrix(j,1,i)=minval(fmatrix(j,1:w-1,i))
end if
end if

high(i)=maxval(mmatrix(:,1,i))
good(i)=maxval(mmatrix(:,2,i))
moderate(i)=maxval(mmatrix(:,3,i))
poor(i)=maxval(mmatrix(:,4,i))
bad(i)=maxval(mmatrix(:,5,i))
end do

end subroutine rules1
