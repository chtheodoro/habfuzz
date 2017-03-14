subroutine meanmax
use fdeclarations

implicit none
!Defuzzification according to the mean-max method

do i=1,z
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
if (hs(i)>0) then

if (hs(i)==high(i)) then
x1high(i)=high(i)*hm-high(i)*ha+ha
x2high(i)=hb-high(i)*hb+high(i)*hm
aa(i,zz)=((x1high(i)+x2high(i))/2)/5
else if (hs(i)==good(i)) then
x1good(i)=good(i)*gm-good(i)*ga+ga
x2good(i)=gb-good(i)*gb+good(i)*gm
aa(i,zz)=((x1good(i)+x2good(i))/2)/5
else if (hs(i)==moderate(i)) then
x1mod(i)=moderate(i)*mm-moderate(i)*ma+ma
x2mod(i)=mb-moderate(i)*mb+moderate(i)*mm
aa(i,zz)=((x1mod(i)+x2mod(i))/2)/5
else if (hs(i)==poor(i)) then
x1poor(i)=poor(i)*pm-poor(i)*pa+pa
x2poor(i)=pb-poor(i)*pb+poor(i)*pm
aa(i,zz)=((x1poor(i)+x2poor(i))/2)/5
else
x1bad(i)=bad(i)*bm-bad(i)*ba+ba
x2bad(i)=bb-bad(i)*bb+bad(i)*bm
aa(i,zz)=((x1bad(i)+x2bad(i))/2)/5
end if
else
aa(i,zz)=aa(i-1,zz)
end if
end do

do i=1,z
if (l==1) then
suitability(i,zz)=aa(i,zz)
else if (l==2) then
s(i,zz)=aa(i,zz)
end if
end do

end subroutine meanmax
