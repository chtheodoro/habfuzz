subroutine centroid
use fdeclarations

implicit none

do i=1,z
hs(i)=max(high(i),good(i),moderate(i),poor(i),bad(i))

if (hs(i)>0) then
slopeb(i)=(0-bad(i))/(1.25-0.75)
interb(i)=bad(i)-slopeb(i)*0.75
slopep1(i)=((poor(i)-0))/(1.25-0.75)
interp1(i)=poor(i)-slopep1(i)*1.25
slopep2(i)=(0-poor(i))/(2.25-1.75)
interp2(i)=poor(i)-slopep2(i)*1.75
slopem1(i)=((moderate(i)-0))/(2.25-1.75)
interm1(i)=moderate(i)-slopem1(i)*2.25
slopem2(i)=(0-moderate(i))/(3.25-2.75)
interm2(i)=moderate(i)-slopem2(i)*2.75
slopeg1(i)=((good(i)-0))/(3.25-2.75)
interg1(i)=good(i)-slopeg1(i)*3.25
slopeg2(i)=(0-good(i))/(4.25-3.75)
interg2(i)=good(i)-slopeg2(i)*3.75
slopeh(i)=((high(i)-0))/(5.25-3.75)
interh(i)=high(i)-slopeh(i)*4.25
!print *, 'slopeb and interb'
!print *, slopeb, interb
!print *, slopep1, interp1
!print *, slopep2, interp2
!print *, slopem1, interm1
!print *, slopem2, interm2
!print *, slopeg1, interg1
!print *, slopeg2, interg2
!print *, slopeh, interh
!read(*,*)

ibp(i)=(interb(i)*slopep1(i)-interp1(i)*slopeb(i))/(slopep1(i)-slopeb(i))
ibpx(i)=(interp1(i)-interb(i))/(slopeb(i)-slopep1(i))
ipm(i)=(interp2(i)*slopem1(i)-interm1(i)*slopep2(i))/(slopem1(i)-slopep2(i))
ipmx(i)=(interm1(i)-interp2(i))/(slopep2(i)-slopem1(i))
img(i)=(interm2(i)*slopeg1(i)-interg1(i)*slopem2(i))/(slopeg1(i)-slopem2(i))
imgx(i)=(interg1(i)-interm2(i))/(slopem2(i)-slopeg1(i))
igh(i)=(interg2(i)*slopeh(i)-interh(i)*slopeg2(i))/(slopeh(i)-slopeg2(i))
ighx(i)=(interh(i)-interg2(i))/(slopeg2(i)-slopeh(i))

if ((bad(i)>0 .and. bad(i)<1) .and. (poor(i)>0 .and. poor(i)<1)) then
ibp(i)=ibp(i)
ibpx(i)=ibpx(i)
else if ((bad(i)>0 .and. bad(i)<1) .and. (poor(i)==0)) then
ibp(i)=0
ibpx(i)=1.25
else if (bad(i)==1) then
ibp(i)=0
ibpx(i)=1.25
else
ibp(i)=0
ibpx(i)=1.25
end if

if ((poor(i)>0 .and. poor(i)<1) .and. (moderate(i)>0 .and. moderate(i)<1)) then
ipm(i)=ipm(i)
ipmx(i)=ipmx(i)
else if ((poor(i)>0 .and. poor(i)<1) .and. (moderate(i)==0)) then
ipm(i)=0
ipmx(i)=2.25
else if (poor(i)==1) then
ipm(i)=0
ipmx(i)=2.25
else
ipm(i)=0
ipmx(i)=2.25
end if

if ((moderate(i)>0 .and. moderate(i)<1) .and. (good(i)>0 .and. good(i)<1)) then
img(i)=img(i)
imgx(i)=imgx(i)
else if ((moderate(i)>0 .and. moderate(i)<1) .and. (good(i)==0)) then
img(i)=0
imgx(i)=3.25
else if (moderate(i)==1) then
img(i)=0
imgx(i)=3.25
else
img(i)=0
imgx(i)=3.25
end if

if ((good(i)>0 .and. good(i)<1) .and. (high(i)>0 .and. high(i)<1)) then
igh(i)=igh(i)
ighx(i)=ighx(i)
else if ((good(i)>0 .and. good(i)<1) .and. (high(i)==0)) then
igh(i)=0
ighx(i)=4.25
else if (good(i)==1) then
igh(i)=0
ighx(i)=4.25
else
igh(i)=0
ighx(i)=4.25
end if

!print *, 'ibp'
!print *, ibp, ipm, img, igh

!print *, 'ibpx'
!print *, ibpx, ipmx, imgx, ighx
!read(*,*)
a1b(i)=bad(i)*0.75
a2b(i)=ibp(i)*(ibpx(i)-0.75)
a3b(i)=0.5*((ibpx(i)-0.75))*(abs(bad(i)-ibp(i)))

a1p(i)=(1.25-ibpx(i))*ibp(i)
a2p(i)=(1.25-ibpx(i))*0.5*(poor(i)-ibp(i))
a3p(i)=(1.75-1.25)*poor(i)
a4p(i)=(ipmx(i)-1.75)*ipm(i)
a5p(i)=(abs(poor(i)-ipm(i)))*0.5*((ipmx(i)-1.75))

a1m(i)=(2.25-ipmx(i))*ipm(i)
a2m(i)=(2.25-ipmx(i))*0.5*(moderate(i)-ipm(i))
a3m(i)=(2.75-2.25)*moderate(i)
a4m(i)=(imgx(i)-2.75)*img(i)
a5m(i)=(abs(moderate(i)-img(i)))*0.5*((imgx(i)-2.75))

a1g(i)=(3.25-imgx(i))*img(i)
a2g(i)=(3.25-imgx(i))*0.5*(good(i)-img(i))
a3g(i)=(3.75-3.25)*good(i)
a4g(i)=(ighx(i)-3.75)*igh(i)
a5g(i)=(abs(good(i)-igh(i)))*0.5*(ighx(i)-3.75)

a1h(i)=(4.25-ighx(i))*igh(i)
a2h(i)=(4.25-ighx(i))*0.5*(high(i)-igh(i))
a3h(i)=(5.00-4.25)*high(i)

c1b(i)=0.75/2
c2b(i)=(ibpx(i)-0.75)/2+0.75
c3b(i)=(ibpx(i)-0.75)/2+0.75

c1p(i)=(1.25-ibpx(i))/2+1.25
c2p(i)=(1.25-ibpx(i))/2+1.25
c3p(i)=(1.75-1.25)+1
c4p(i)=abs(ipmx(i)-1.75)/2+1.75
c5p(i)=abs(ipmx(i)-1.75)/2+1.75

c1m(i)=(2.25-ipmx(i))/2+2.25!
c2m(i)=(2.25-ipmx(i))/2+2.25!
c3m(i)=2.75-2.25+2
c4m(i)=abs(imgx(i)-2.75)/2+2.75
c5m(i)=abs(imgx(i)-2.75)/2+2.75

c1g(i)=(3.25-imgx(i))/2+3.25!
c2g(i)=(3.25-imgx(i))/2+3.25!
c3g(i)=3.75-3.25+3
c4g(i)=abs(ighx(i)-3.75)/2+3.75
c5g(i)=abs(ighx(i)-3.75)/2+3.75

c1h(i)=abs(4.25-ighx(i))/2+4.25
c2h(i)=abs(4.25-ighx(i))/2+4.25
c3h(i)=4.5

if (poor(i)==1) then
a5p(i)=0
else if (moderate(i)==1) then
a5m(i)=0
else if (good(i)==1) then
a5g(i)=0
end if

actb(i)=a1b(i)*c1b(i)+a2b(i)*c2b(i)+a3b(i)*c3b(i)
actp(i)=a1p(i)*c1p(i)+a2p(i)*c2p(i)+a3p(i)*c3p(i)+a4p(i)*c4p(i)!+a5p(i)*c5p(i)
actm(i)=a1m(i)*c1m(i)+a2m(i)*c2m(i)+a3m(i)*c3m(i)+a4m(i)*c4m(i)!+a5m(i)*c5m(i)
actg(i)=a1g(i)*c1g(i)+a2g(i)*c2g(i)+a3g(i)*c3g(i)+a4g(i)*c4g(i)!+a5g(i)*c5g(i)
acth(i)=a1h(i)*c1h(i)+a2h(i)*c2h(i)+a3h(i)*c3h(i)
atb(i)=a1b(i)+a2b(i)+a3b(i)
atp(i)=a1p(i)+a2p(i)+a3p(i)+a4p(i)!+a5p(i)
atm(i)=a1m(i)+a2m(i)+a3m(i)+a4m(i)!+a5m(i)
atg(i)=a1g(i)+a2g(i)+a3g(i)+a4g(i)!+a5g(i)
ath(i)=a1h(i)+a2h(i)+a3h(i)

!print *, 'a1s'
!print *, a1b, a2b, a3b, a1p, a2p, a3p, a4p, a5p, a1m, a2m, a3m, a4m, a5m
!print *, 'c'
!print *, c1b, c2b, c3b, c1p, c2p, c3p, c4p, c5p, c1m, c2m, c3m, c4m, c5m

!print *, 'acts'
!print *, actb, actp, actm, actg, acth
!print *, atb, atp, atm, atg, ath

if (l==1) then
suitability(i,zz) = ((actb(i)+actp(i)+actm(i)+actg(i)+acth(i))/(atb(i)+atp(i)+atm(i)+atg(i)+ath(i)))/5
else if (l==2) then
s(i,zz) = ((actb(i)+actp(i)+actm(i)+actg(i)+acth(i))/(atb(i)+atp(i)+atm(i)+atg(i)+ath(i)))/5
else
suitability(i,zz)=suitability(i-1,zz)
s(i,zz)=s(i-1,zz)
end if
end if
end do
end subroutine centroid
