subroutine fuzzifier
use fdeclarations

implicit none

!Flow velocity fuzzyfication
do i=1,n
if (u(i)<=uvla) then
uvlow=1
else if (u(i)>uvla .and. u(i)<uvlb) then
uvlow=(uvlb-u(i))/(uvlb-uvla)
else
uvlow=0
end if
if (u(i)<=ula) then
ulow=0
else if (u(i)>ula .and. u(i)<ulb) then
ulow=(u(i)-ula)/(umb-ula)
else if (u(i)>=ulb .and. u(i)<ulc) then
ulow=1
else if (u(i)>=ulc .and. u(i)<uld) then
ulow=(uld-u(i))/(uld-ulc)
else
ulow=0
end if
if (u(i)<=uma) then
umoderate=0
else if (u(i)>uma .and. u(i)<umb) then
umoderate=(u(i)-uma)/(umb-uma)
else if (u(i)>=umb .and. u(i)<umc) then
umoderate=1
else if (u(i)>=umc .and. u(i)<umd) then
umoderate=(umd-u(i))/(umd-umc)
else
umoderate=0
end if
if (u(i)<=uha) then
uhigh=0
else if (u(i)>uha .and. u(i)<uhb) then
uhigh=(u(i)-uha)/(uhb-uha)
else if (u(i)>=uhb .and. u(i)<uhc) then
uhigh=1
else if (u(i)>=uhc .and. u(i)<uhd) then
uhigh=(uhd-u(i))/(uhd-uhc)
else
uhigh=0
end if
if (u(i)<=uvha) then
uvhigh=0
else if (u(i)>uvha .and. u(i)<uvhb) then
uvhigh=(u(i)-uvha)/(uvhb-uvha)
else
uvhigh=1
end if

uvl(i) = uvlow
ul(i) = ulow
um(i) = umoderate
uh(i) = uhigh
uvh(i) = uvhigh
end do
                                           
!Water depth fuzzyfication
do i=1,n
if (d(i)<=dvla) then
dvshallow=1
else if (d(i)>dvla .and. d(i)<dvlb) then
dvshallow=(dvlb-d(i))/(dvlb-dvla)
else
dvshallow=0
end if
if (d(i)<=dla) then
dshallow=0
else if (d(i)>dla .and. d(i)<dlb) then
dshallow=(d(i)-dla)/(dlb-dla)
else if (d(i)>=dlb .and. d(i)<dlc) then
dshallow=1
else if (d(i)>=dlc .and. d(i)<dld) then
dshallow=(dld-d(i))/(dld-dlc)
else
dshallow=0
end if
if (d(i)<=dma) then
dmoderate=0
else if (d(i)>dma .and. d(i)<dmb) then
dmoderate=(d(i)-dma)/(dmb-dma)
else if (d(i)>=dmb .and. d(i)<dmc) then
dmoderate=1
else if (d(i)>=dmc .and. d(i)<dmd) then
dmoderate=(dmd-d(i))/(dmd-dmc)
else
dmoderate=0
end if
if (d(i)<=dda) then
ddeep=0
else if (d(i)>dda .and. d(i)<ddb) then
ddeep=(d(i)-dda)/(ddb-dda)
else if (d(i)>=ddb .and. d(i)<ddc) then
ddeep=1
else if (d(i)>=ddc .and. d(i)<ddd) then
ddeep=(ddd-d(i))/(ddd-ddc)
else
ddeep=0
end if
if (d(i)<=dvda) then
dvdeep=0
else if (d(i)>=dvda .and. d(i)<=dvdb) then
dvdeep=(d(i)-dvda)/(dvdb-dvda)
else
dvdeep=1
end if

dvs(i) = dvshallow
ds(i) = dshallow
dm(i) = dmoderate
dd(i) = ddeep
dvd(i) = dvdeep
end do

!Substrate type is not fuzzified and treated as a crisp value
do i=1,n
if (sub(i)==0.070) then
bld(i)=1
else if (sub(i)==0.050) then
ls(i)=1
else if (sub(i)==0.040) then
ss(i)=1
else if (sub(i)==0.030) then
lg(i)=1
else if (sub(i)==0.026) then
mg(i)=1
elseif (sub(i)==0.024) then
fg(i)=1
else if (sub(i)==0.022) then
sand(i)=1
else
silt(i)=1
end if
end do

end subroutine fuzzifier
