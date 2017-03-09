subroutine waver
use fdeclarations

!Defuzzification using the weighted average method
implicit none

do i=1,z
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
if (hs(i)>0) then

if (bad(i)<=0) then
xbad(i)=0
else if (bad(i)>0 .and. bad(i)<=1)then
xbad(i)=0.5
else
xbad(i)=0
end if
if (poor(i)<=0) then
xpoor(i)=0
else if (poor(i)>0 .and. poor(i)<=1)then
xpoor(i)=1.5
else
xpoor(i)=0
end if
if (moderate(i)<=0) then
xmod(i)=0
else if (moderate(i)>0 .and. moderate(i)<=1)then
xmod(i)=2.5
else
xmod(i)=0
end if
if (good(i)<=0) then
xgood(i)=0
else if (good(i)>0 .and. good(i)<=1)then
xgood(i)=3.5
else
xgood(i)=0
end if
if (high(i)<=0) then
xhigh(i)=0
else if (high(i)>0 .and. high(i)<=1)then
xhigh(i)=4.5
else
xhigh(i)=0
end if
xint(i)=xbad(i)*bad(i)+xpoor(i)*poor(i)+xmod(i)*moderate(i)+xgood(i)*good(i)+xhigh(i)*high(i)
yint(i)=bad(i)+poor(i)+moderate(i)+good(i)+high(i)
if (l==1) then
suitability(i,zz)=(xint(i)/yint(i))/5
else if (l==2) then
s(i,zz)=(xint(i)/yint(i))/5
else
suitability(i,zz)=-1
s(i,zz)=-1
end if
end if
end do

end subroutine waver
