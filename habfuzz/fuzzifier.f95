subroutine fuzzifier
use fdeclarations

implicit none
allocate(uf(z,e))
allocate(df(z,e))
allocate(tf(z,e))
allocate(sf(z,e))
sf(:,:)=0
uf(:,:)=0
df(:,:)=0
tf(:,:)=0

do i=1,z
if (ematrix(i,1)<=uvla) then
uf(i,1)=1
else if (ematrix(i,1)>uvla .and. ematrix(i,1)<=uvlb) then
uf(i,1)=(uvlb-ematrix(i,1))/(uvlb-uvla)
else
uf(i,1)=0
end if
if (ematrix(i,1)<=ula) then
uf(i,2)=0
else if (ematrix(i,1)>ula .and. ematrix(i,1)<=ulb) then
uf(i,2)=(ematrix(i,1)-ula)/(ulb-ula)
else if (ematrix(i,1)>ulb .and. ematrix(i,1)<=ulc) then
uf(i,2)=1
else if (ematrix(i,1)>ulc .and. ematrix(i,1)<=uld) then
uf(i,2)=(uld-ematrix(i,1))/(uld-ulc)
else
uf(i,2)=0
end if
if (ematrix(i,1)<=uma) then
uf(i,3)=0
else if (ematrix(i,1)>uma .and. ematrix(i,1)<=umb) then
uf(i,3)=(ematrix(i,1)-uma)/(umb-uma)
else if (ematrix(i,1)>umb .and. ematrix(i,1)<=umc) then
uf(i,3)=1
else if (ematrix(i,1)>umc .and. ematrix(i,1)<=umd) then
uf(i,3)=(umd-ematrix(i,1))/(umd-umc)
else
uf(i,3)=0
end if
if (ematrix(i,1)<=uha) then
uf(i,4)=0
else if (ematrix(i,1)>uha .and. ematrix(i,1)<=uhb) then
uf(i,4)=(ematrix(i,1)-uha)/(uhb-uha)
else if (ematrix(i,1)>uhb .and. ematrix(i,1)<=uhc) then
uf(i,4)=1
else if (ematrix(i,1)>uhc .and. ematrix(i,1)<=uhd) then
uf(i,4)=(uhd-ematrix(i,1))/(uhd-uhc)
else
uf(i,4)=0
end if
if (ematrix(i,1)<=uvha) then
uf(i,5)=0
else if (ematrix(i,1)>uvha .and. ematrix(i,1)<=uvhb) then
uf(i,5)=(ematrix(i,1)-uvha)/(uvhb-uvha)
else
uf(i,5)=1
end if
end do

do i=1,z
if (ematrix(i,2)<=dvla) then
df(i,1)=1
else if (ematrix(i,2)>dvla .and. (ematrix(i,2)<=dvlb)) then
df(i,1)=(dvlb-ematrix(i,2))/(dvlb-dvla)
else
df(i,1)=0
end if
if (ematrix(i,2)<=dla) then
df(i,2)=0
else if (ematrix(i,2)>dla .and. (ematrix(i,2)<=dlb)) then
df(i,2)=(ematrix(i,2)-dla)/(dlb-dla)
else if (ematrix(i,2)>dlb .and. ematrix(i,2)<=dlc) then
df(i,2)=1
else if (ematrix(i,2)>dlc .and. ematrix(i,2)<=dld) then
df(i,2)=(dld-ematrix(i,2))/(dld-dlc)
else
df(i,2)=0
end if
if (ematrix(i,2)<=dma) then
df(i,3)=0
else if (ematrix(i,2)>dma .and. ematrix(i,2)<=dmb) then
df(i,3)=(ematrix(i,2)-dma)/(dmb-dma)
else if (ematrix(i,2)>dmb .and. ematrix(i,2)<=dmc) then
df(i,3)=1
else if (ematrix(i,2)>dmc .and. ematrix(i,2)<=dmd) then
df(i,3)=(dmd-ematrix(i,2))/(dmd-dmc)
else
df(i,3)=0
end if
if (ematrix(i,2)<=dda) then
df(i,4)=0
else if (ematrix(i,2)>dda .and. ematrix(i,2)<=ddb) then
df(i,4)=(ematrix(i,2)-dda)/(ddb-dda)
else if (ematrix(i,2)>ddb .and. ematrix(i,2)<=ddc) then
df(i,4)=1
else if (ematrix(i,2)>ddc .and. ematrix(i,2)<=ddd) then
df(i,4)=(ddd-ematrix(i,2))/(ddd-ddc)
else
df(i,4)=0
end if
if (ematrix(i,2)<=dvda) then
df(i,5)=0
else if (ematrix(i,2)>dvda .and. ematrix(i,2)<=dvdb) then
df(i,5)=(ematrix(i,2)-dvda)/(dvdb-dvda)
else
df(i,5)=1
end if
end do

do i=1,z
if (ematrix(i,4)<=tvla) then
tf(i,1)=1
else if (ematrix(i,4)>tvla .and. ematrix(i,4)<=tvlb) then
tf(i,1)=(tvlb-ematrix(i,4))/(tvlb-tvla)
else
tf(i,1)=0
end if
if (ematrix(i,4)<=tla) then
tf(i,2)=0
else if (ematrix(i,4)>tla .and. ematrix(i,4)<=tlb) then
tf(i,2)=(ematrix(i,4)-tla)/(tlb-tla)
else if (ematrix(i,4)>tlb .and. ematrix(i,4)<=tlc) then
tf(i,2)=1
else if (ematrix(i,4)>tlc .and. ematrix(i,4)<=tld) then
tf(i,2)=(tld-ematrix(i,4))/(tld-tlc)
else
tf(i,2)=0
end if
if (ematrix(i,4)<=tma) then
tf(i,3)=0
else if (ematrix(i,4)>tma .and. ematrix(i,4)<=tmb) then
tf(i,3)=(ematrix(i,4)-tma)/(tmb-tma)
else if (ematrix(i,4)>tmb .and. ematrix(i,4)<=tmc) then
tf(i,3)=1
else if (ematrix(i,4)>tmc .and. ematrix(i,4)<=tmd) then
tf(i,3)=(tmd-ematrix(i,4))/(tmd-tmc)
else
tf(i,3)=0
end if
if (ematrix(i,4)<=tha) then
tf(i,4)=0
else if (ematrix(i,4)>tha .and. ematrix(i,4)<=thb) then
tf(i,4)=(ematrix(i,4)-tha)/(thb-tha)
else if (ematrix(i,4)>thb .and. ematrix(i,4)<=thc) then
tf(i,4)=1
else if (ematrix(i,4)>thc .and. ematrix(i,4)<=thd) then
tf(i,4)=(thd-ematrix(i,4))/(thd-thc)
else
tf(i,4)=0
end if
if (ematrix(i,4)<=tvha) then
tf(i,5)=0
else if (ematrix(i,4)>tvha .and. ematrix(i,4)<=tvhb) then
tf(i,5)=(ematrix(i,4)-tvha)/(tvhb-tvha)
else
tf(i,5)=1
end if
end do

!do i=1,z
!if (ematrix(i,4)<=tvla) then
!tf(i,1)=1
!else if (ematrix(i,4)>tvla .and. ematrix(i,4)<=tvlb) then
!tf(i,1)=(tvlb-ematrix(i,4))/(tvlb-tvla)
!else
!tf(i,1)=0
!end if
!if (ematrix(i,4)<=tla) then
!tf(i,1)=0
!else if (ematrix(i,4)>tla .and. ematrix(i,4)<=tlb) then
!tf(i,1)=(ematrix(i,4)-tla)/(tlb-tla)
!else if (ematrix(i,4)>tlb .and. ematrix(i,4)<=tlc) then
!tf(i,1)=1
!else if (ematrix(i,4)>tlc .and. ematrix(i,4)<=tld) then
!tf(i,1)=(tld-ematrix(i,4))/(tld-tlc)
!else
!tf(i,1)=0
!end if
!if (ematrix(i,4)<=tma) then
!tf(i,1)=0
!else if (ematrix(i,4)>tma .and. ematrix(i,4)<=tmb) then
!tf(i,1)=(ematrix(i,4)-tma)/(tmb-tma)
!else if (ematrix(i,4)>tmb .and. ematrix(i,4)<=tmc) then
!tf(i,1)=1
!else if (ematrix(i,4)>tmc .and. ematrix(i,4)<=tmd) then
!tf(i,1)=(tmd-ematrix(i,4))/(tmd-tmc)
!else
!tf(i,1)=0
!end if
!if (ematrix(i,4)<=tha) then
!tf(i,2)=0
!else if (ematrix(i,4)>tha .and. ematrix(i,4)<=thb) then
!tf(i,2)=(ematrix(i,4)-tha)/(thb-tha)
!else if (ematrix(i,4)>thb .and. ematrix(i,4)<=thc) then
!tf(i,2)=1
!else if (ematrix(i,4)>thc .and. ematrix(i,4)<=thd) then
!tf(i,2)=(thd-ematrix(i,4))/(thd-thc)
!else
!tf(i,2)=0
!end if
!if (ematrix(i,4)<=tvha) then
!tf(i,2)=0
!else if (ematrix(i,4)>tvha .and. ematrix(i,4)<=tvhb) then
!tf(i,2)=(ematrix(i,4)-tvha)/(tvhb-tvha)
!else
!tf(i,2)=1
!end if
!end do
              
!Substrate in 8 classes
do i=1,z
if (ematrix(i,3)==0.020) then
sf(i,1)=1
else if (ematrix(i,3)==0.022) then
sf(i,2)=1
else if (ematrix(i,3)==0.024) then
sf(i,3)=1
else if (ematrix(i,3)==0.026) then
sf(i,4)=1
else if (ematrix(i,3)==0.030) then
sf(i,5)=1
elseif (ematrix(i,3)==0.040) then
sf(i,6)=1
else if (ematrix(i,3)==0.050) then
sf(i,7)=1
else if (ematrix(i,3)==0.070) then
sf(i,8)=1
end if
end do

!Substrate in 3 classes
!do i=1,z
!if (ematrix(i,3)==0.020) then
!sf(i,1)=1
!else if (ematrix(i,3)==0.022) then
!sf(i,1)=1
!else if (ematrix(i,3)==0.024) then
!sf(i,2)=1
!else if (ematrix(i,3)==0.026) then
!sf(i,2)=1
!else if (ematrix(i,3)==0.030) then
!sf(i,2)=1
!else if (ematrix(i,3)==0.040) then
!sf(i,2)=1
!else if (ematrix(i,3)==0.050) then
!sf(i,3)=1
!else if (ematrix(i,3)==0.070) then
!sf(i,3)=1
!end if
!end do

end subroutine fuzzifier
