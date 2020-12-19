subroutine reader
use fdeclarations
implicit none

if (vers==1) then
open(unit=10,file='fuzzysets.txt',status='old',action='read')
read(10,*) uvla,uvlb,ula,ulb,ulc,uld,uma,umb,umc,umd,uha,uhb,uhc,uhd,uvha,uvhb, &
dvla,dvlb,dla,dlb,dlc,dld,dma,dmb,dmc,dmd,dda,ddb,ddc,ddd,dvda,dvdb,boulders, &
large_stones,small_stones,large_gravel,medium_gravel,fine_gravel,sand,silt,tvla,tvlb, &
tla,tlb,tlc,tld,tma,tmb,tmc,tmd,tha,thb,thc,thd,tvha,tvhb
else if (vers==2) then
open(unit=10,file='fuzzysets_hff.txt',status='old',action='read')
read(10,*) uvla,uvlb,ula,ulb,ulc,uld,uma,umb,umc,umd,uha,uhb,uhc,uhd,uvha,uvhb, &
dvla,dvlb,dla,dlb,dlc,dld,dma,dmb,dmc,dmd,dda,ddb,ddc,ddd,dvda,dvdb, &
svla,svlb,sla,slb,slc,sld,sma,smb,smc,smd,sda,sdb,sdc,sdd,svda,svdb, &
tvla,tvlb,tla,tlb,tlc,tld,tma,tmb,tmc,tmd,tha,thb,thc,thd,tvha,tvhb
end if
close(10)
end subroutine reader
