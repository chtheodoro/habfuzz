subroutine defuzzifier
use fdeclarations

implicit none
!STEP 3 OF HABFUZZ - DEFUZZIFICATION: FUZZY SETS ARE DEFUZZIFIED INTO CRISP VALUES USING (A) THE MAX MEMBERSHIP (HEIGHT) METHOD AND(B) THE CENTROID METHOD
!---------------------------------------------------------------------------------------------------------------------------------------------------------

!Calculating hs as an index to return possible non-existing combinations
do i=1,n
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))
end do

!(A)MAXIMUM MEMBERSHIP
do i=1,n
if (hs(i)>0) then
if (hs(i)==high(i)) then
suitability(i)=5
else if (hs(i)==good(i)) then
suitability(i)=4
else if (hs(i)==moderate(i)) then
suitability(i)=3
else if (hs(i)==poor(i)) then
suitability(i)=2
else
suitability(i)=1
end if
         
!(B)CENTROID
if (bad(i)<=0) then
xbad(i)=0
x1bad(i)=0
x2bad(i)=0
ybad(i)=0
else if (bad(i)>0 .and. bad(i)<1)then
xbad(i)=0.5
x1bad(i)=bad(i)*bm-bad(i)*ba+ba
x2bad(i)=bb-bad(i)*bb+bad(i)*bm
ybad(i)=3*bad(i)
else
xbad(i)=0.5
x1bad(i)=0
x2bad(i)=0
ybad(i)=bad(i)
end if
if (poor(i)<=0) then
xpoor(i)=0
x1poor(i)=0
x2poor(i)=0
ypoor(i)=0
else if (poor(i)>0 .and. poor(i)<1)then
xpoor(i)=1.5
x1poor(i)=poor(i)*pm-poor(i)*pa+pa
x2poor(i)=pb-poor(i)*pb+poor(i)*pm
ypoor(i)=3*poor(i)
else
xpoor(i)=1.5
x1poor(i)=0
x2poor(i)=0
ypoor(i)=poor(i)
end if
if (moderate(i)<=0) then
xmod(i)=0
x1mod(i)=0
x2mod(i)=0
ymod(i)=0
else if (moderate(i)>0 .and. moderate(i)<1)then
xmod(i)=2.5
x1mod(i)=moderate(i)*mm-moderate(i)*ma+ma
x2mod(i)=mb-moderate(i)*mb+moderate(i)*mm
ymod(i)=3*moderate(i)
else
xmod(i)=2.5
x1mod(i)=0
x2mod(i)=0
ymod(i)=moderate(i)
end if
if (good(i)<=0) then
xgood(i)=0
x1good(i)=0
x2good(i)=0
ygood(i)=0
else if (good(i)>0 .and. good(i)<1)then
xgood(i)=3.5
x1good(i)=good(i)*gm-good(i)*ga+ga
x2good(i)=gb-good(i)*gb+good(i)*gm
ygood(i)=3*good(i)
else
xgood(i)=3.5
x1good(i)=0
x2good(i)=0
ygood(i)=good(i)
end if
if (high(i)<=0) then
xhigh(i)=0
x1high(i)=0
x2high(i)=0
yhigh(i)=0
else if (high(i)>0 .and. high(i)<1)then
xhigh(i)=4.5
x1high(i)=high(i)*hm-high(i)*ha+ha
x2high(i)=high(i)-high(i)*hb+high(i)*hm
yhigh(i)=3*high(i)
else
xhigh(i)=4.5
x1high(i)=0
x2high(i)=0
yhigh(i)=high(i)
end if
                                   
xcent(i) = bad(i)*x1bad(i)+bad(i)*xbad(i)+bad(i)*x2bad(i)
xcent2(i) = poor(i)*x1poor(i)+poor(i)*x2poor(i)+poor(i)*xpoor(i)
xcent3(i) = moderate(i)*x1mod(i)+moderate(i)*x2mod(i)+moderate(i)*xmod(i)
xcent4(i) = good(i)*x1good(i)+good(i)*x2good(i)+good(i)*xgood(i)
xcent5(i) = high(i)*x1high(i)+high(i)*x2high(i)+high(i)*xhigh(i)
ycent(i) = ybad(i)+ypoor(i)+ymod(i)+ygood(i)+yhigh(i)
centroid(i) =(xcent(i)+xcent2(i)+xcent3(i)+xcent4(i)+xcent5(i))/ycent(i)

else
suitability(i)=-5
centroid(i)=-5

end if
end do

end subroutine defuzzifier
