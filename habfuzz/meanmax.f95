subroutine meanmax
use fdeclarations

implicit none
!Defuzzification according to the mean-max method

do i=1,n
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
if (hs(i)>0) then

if (hs(i)==high(i)) then
x1high(i)=high(i)*hm-high(i)*ha+ha
x2high(i)=high(i)-high(i)*hb+high(i)*hm
suitability(i)=(x1high(i)+x2high(i))/2
else if (hs(i)==good(i)) then
x1good(i)=good(i)*gm-good(i)*ga+ga
x2good(i)=gb-good(i)*gb+good(i)*gm
suitability(i)=(x1good(i)+x2good(i))/2
else if (hs(i)==moderate(i)) then
x1mod(i)=moderate(i)*mm-moderate(i)*ma+ma
x2mod(i)=mb-moderate(i)*mb+moderate(i)*mm
suitability(i)=(x1mod(i)+x2mod(i))/2
else if (hs(i)==poor(i)) then
x1poor(i)=poor(i)*pm-poor(i)*pa+pa
x2poor(i)=pb-poor(i)*pb+poor(i)*pm
suitability(i)=(x1poor(i)+x2poor(i))/2
else
x1bad(i)=bad(i)*bm-bad(i)*ba+ba
x2bad(i)=bb-bad(i)*bb+bad(i)*bm
suitability(i)=(x1bad(i)+x2bad(i))/2
end if

else
suitability(i)=-5
end if
end do

end subroutine meanmax
