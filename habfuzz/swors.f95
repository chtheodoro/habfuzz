subroutine swors
use fdeclarations

implicit none

!--------------------!
!uvl: VERY LOW V     !
!ul: LOW V           !
!um: MODERATE V      !
!uh: HIGH V          !
!uvh: VERY HIGH V    !
!--------------------!
!dvs: VERY SHALLOW D !
!ds: SHALLOW D       !
!dm: MODERATE D      !
!dd: DEEP D          !
!dvd: VERY DEEP D    !
!--------------------!

do i=1,n
b2(i,1)=min(ul(i),ds(i),bld(i))
b2(i,2)=min(uvh(i),dm(i),bld(i))
b2(i,3)=min(uvl(i),dvs(i),sand(i))
b2(i,4)=min(uvl(i),dm(i),bld(i))
g2(i,1)=min(uh(i),dvs(i),ls(i))
g2(i,2)=min(uh(i),dm(i),ls(i))
g2(i,3)=min(uvl(i),dvs(i),lg(i))
g2(i,4)=min(uvl(i),dm(i),lg(i))
g2(i,5)=min(um(i),dvs(i),lg(i))
h2(i,1)=min(uvh(i),ds(i),ss(i))
h2(i,2)=min(um(i),ds(i),bld(i))
h2(i,3)=min(um(i),dvs(i),bld(i))
m2(i,1)=min(uh(i),ds(i),lg(i))
m2(i,2)=min(uh(i),ds(i),ls(i))
m2(i,3)=min(uh(i),dvs(i),ss(i))
m2(i,4)=min(uh(i),dm(i),bld(i))
m2(i,5)=min(uh(i),dm(i),ss(i))
m2(i,6)=min(ul(i),dd(i),bld(i))
m2(i,7)=min(ul(i),ds(i),mg(i))
m2(i,8)=min(ul(i),ds(i),ss(i))
m2(i,9)=min(ul(i),dvd(i),ls(i))
m2(i,10)=min(ul(i),dvs(i),bld(i))
m2(i,11)=min(ul(i),dvs(i),ls(i))
m2(i,12)=min(ul(i),dvs(i),mg(i))
m2(i,13)=min(ul(i),dvs(i),ss(i))
m2(i,14)=min(ul(i),dm(i),bld(i))
m2(i,15)=min(ul(i),dm(i),ss(i))
m2(i,16)=min(uvh(i),dm(i),lg(i))
m2(i,17)=min(uvl(i),ds(i),sand(i))
m2(i,18)=min(uvl(i),dvs(i),ls(i))
m2(i,19)=min(uvl(i),dm(i),fg(i))
m2(i,20)=min(uvl(i),dm(i),sand(i))
m2(i,21)=min(um(i),dd(i),ss(i))
m2(i,22)=min(um(i),dd(i),lg(i))
m2(i,23)=min(um(i),ds(i),lg(i))
m2(i,24)=min(um(i),ds(i),ls(i))
m2(i,25)=min(um(i),ds(i),mg(i))
m2(i,26)=min(um(i),ds(i),ss(i))
m2(i,27)=min(um(i),dvs(i),ss(i))
m2(i,28)=min(um(i),dm(i),lg(i))
p2(i,1)=min(uh(i),ds(i),bld(i))
p2(i,2)=min(uh(i),ds(i),ss(i))
p2(i,3)=min(uh(i),dm(i),lg(i))
p2(i,4)=min(ul(i),dd(i),ss(i))
p2(i,5)=min(ul(i),ds(i),fg(i))
p2(i,6)=min(ul(i),ds(i),lg(i))
p2(i,7)=min(ul(i),ds(i),ls(i))
p2(i,8)=min(ul(i),dvd(i),lg(i))
p2(i,9)=min(ul(i),dvs(i),lg(i))
p2(i,10)=min(ul(i),dm(i),lg(i))
p2(i,11)=min(ul(i),dm(i),ls(i))
p2(i,12)=min(uvh(i),ds(i),bld(i))
p2(i,13)=min(uvh(i),ds(i),lg(i))
p2(i,14)=min(uvh(i),ds(i),ls(i))
p2(i,15)=min(uvh(i),ds(i),mg(i))
p2(i,16)=min(uvh(i),dvs(i),fg(i))
p2(i,17)=min(uvh(i),dvs(i),sand(i))
p2(i,18)=min(uvh(i),dm(i),ls(i))
p2(i,19)=min(uvh(i),dm(i),ss(i))
p2(i,20)=min(uvl(i),dd(i),bld(i))
p2(i,21)=min(uvl(i),dd(i),ls(i))
p2(i,22)=min(uvl(i),ds(i),bld(i))
p2(i,23)=min(uvl(i),ds(i),fg(i))
p2(i,24)=min(uvl(i),ds(i),lg(i))
p2(i,25)=min(uvl(i),ds(i),ls(i))
p2(i,26)=min(uvl(i),ds(i),mg(i))
p2(i,27)=min(uvl(i),ds(i),ss(i))
p2(i,28)=min(uvl(i),dvs(i),bld(i))
p2(i,29)=min(uvl(i),dm(i),ls(i))
p2(i,30)=min(uvl(i),dm(i),mg(i))
p2(i,31)=min(um(i),dvs(i),ls(i))
p2(i,32)=min(um(i),dm(i),ls(i))
p2(i,33)=min(um(i),dm(i),ss(i))

high=maxval(h2, dim=2)
good=maxval(g2, dim=2)
moderate=maxval(m2, dim=2)
poor=maxval(p2, dim=2)
bad=maxval(b2, dim=2)
end do

end subroutine swors
