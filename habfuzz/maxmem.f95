subroutine maxmem
use fdeclarations

implicit none

do i=1,n
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
if (hs(i)>0) then
if (hs(i)==high(i)) then
suitability(i)=4.5
else if (hs(i)==good(i)) then
suitability(i)=3.5
else if (hs(i)==moderate(i)) then
suitability(i)=2.5
else if (hs(i)==poor(i)) then
suitability(i)=1.5
else
suitability(i)=0.5
end if
else
suitability(i)=-5
end if
end do

end subroutine maxmem
