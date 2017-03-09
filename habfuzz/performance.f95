subroutine performance
use fdeclarations

implicit none

!For 5 classes of IHS
do i=1,z
if (suitability(i,zz)<=0.2) then
comatrix(i,1,zz)=1
else if (suitability(i,zz)>0.2 .and. suitability(i,zz)<=0.4) then
comatrix(i,1,zz)=2
else if (suitability(i,zz)>0.4 .and. suitability(i,zz)<=0.6) then
comatrix(i,1,zz)=2
else if (suitability(i,zz)>0.6 .and. suitability(i,zz)<=0.8) then
comatrix(i,1,zz)=3
else if (suitability(i,zz)>0.8) then
comatrix(i,1,zz)=3
end if
end do

do i=1,z
if (co1matrix(i,zz)<=0.2) then
comatrix(i,2,zz)=1
else if (co1matrix(i,zz)>0.2 .and. co1matrix(i,zz)<=0.4) then
comatrix(i,2,zz)=2
else if (co1matrix(i,zz)>0.4 .and. co1matrix(i,zz)<=0.6) then
comatrix(i,2,zz)=2
else if (co1matrix(i,zz)>0.6 .and. co1matrix(i,zz)<=0.8) then
comatrix(i,2,zz)=3
else if (co1matrix(i,zz)>0.8) then
comatrix(i,2,zz)=3
end if
end do

!For 3 classes of IHS
!do i=1,z
!if (suitability(i,zz)<=0.2) then
!comatrix(i,1,zz)=1
!else if (suitability(i,zz)>0.2 .and. suitability(i,zz)<=0.3) then
!comatrix(i,1,zz)=1
!else if (suitability(i,zz)>0.3 .and. suitability(i,zz)<=0.6) then
!comatrix(i,1,zz)=2
!else if (suitability(i,zz)>0.6 .and. suitability(i,zz)<=0.8) then
!comatrix(i,1,zz)=3
!else if (suitability(i,zz)>0.8) then
!comatrix(i,1,zz)=3
!end if
!end do

!do i=1,z
!if (co1matrix(i,zz)<=0.2) then
!comatrix(i,2,zz)=1
!else if (co1matrix(i,zz)>0.2 .and. co1matrix(i,zz)<=0.3) then
!comatrix(i,2,zz)=1
!else if (co1matrix(i,zz)>0.3 .and. co1matrix(i,zz)<=0.6) then
!comatrix(i,2,zz)=2
!else if (co1matrix(i,zz)>0.6 .and. co1matrix(i,zz)<=0.8) then
!comatrix(i,2,zz)=3
!else if (co1matrix(i,zz)>0.8) then
!comatrix(i,2,zz)=3
!end if
!end do

do i=1,z
if (comatrix(i,1,zz) .eq. comatrix(i,2,zz)) then
comatrix(i,3,zz)=1
else
comatrix(i,3,zz)=0
end if
icci(zz)=(sum(comatrix(1:z,3,zz)))/z
end do

end subroutine performance
