subroutine maxmem
use fdeclarations

implicit none

do i=1,z
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
if (hs(i)>0) then

if (hs(i)==high(i)) then
aa(i,zz)=0.9
else if (hs(i)==good(i)) then
aa(i,zz)=0.7
else if (hs(i)==moderate(i)) then
aa(i,zz)=0.5
else if (hs(i)==poor(i)) then
aa(i,zz)=0.3
else
aa(i,zz)=0.1
end if

else
aa(i,zz)=-1
end if
end do

do i=1,z
if (l==1) then
suitability(i,zz)=aa(i,zz)
else if (l==2) then
s(i,zz)=aa(i,zz)
end if
end do

end subroutine maxmem
