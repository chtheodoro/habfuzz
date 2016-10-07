subroutine sopt
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
b3(i,1)=min(uvl(i),dvs(i),sand(i))
g3(i,1)=min(uh(i),ds(i),lg(i))
g3(i,2)=min(uh(i),dm(i),ls(i))
g3(i,3)=min(uh(i),dm(i),ss(i))
g3(i,4)=min(ul(i),ds(i),mg(i))
g3(i,5)=min(ul(i),dvs(i),ss(i))
g3(i,6)=min(ul(i),dm(i),bld(i))
g3(i,7)=min(uvh(i),ds(i),lg(i))
g3(i,8)=min(uvl(i),ds(i),fg(i))
g3(i,9)=min(uvl(i),dvs(i),bld(i))
g3(i,10)=min(uvl(i),dvs(i),lg(i))
g3(i,11)=min(uvl(i),dm(i),bld(i))
g3(i,12)=min(uvl(i),dm(i),lg(i))
g3(i,13)=min(um(i),dvs(i),ls(i))
g3(i,14)=min(um(i),dm(i),ls(i))
h3(i,1)=min(uh(i),ds(i),bld(i))
h3(i,2)=min(uh(i),ds(i),ls(i))
h3(i,3)=min(uh(i),ds(i),ss(i))
h3(i,4)=min(uh(i),dvs(i),ls(i))
h3(i,5)=min(ul(i),ds(i),bld(i))
h3(i,6)=min(ul(i),ds(i),lg(i))
h3(i,7)=min(ul(i),ds(i),ls(i))
h3(i,8)=min(ul(i),ds(i),ss(i))
h3(i,9)=min(ul(i),dvs(i),lg(i))
h3(i,10)=min(ul(i),dvs(i),ls(i))
h3(i,11)=min(ul(i),dm(i),ls(i))
h3(i,12)=min(ul(i),dm(i),ss(i))
h3(i,13)=min(uvh(i),ds(i),ls(i))
h3(i,14)=min(uvh(i),ds(i),ss(i))
h3(i,15)=min(uvh(i),dm(i),ls(i))
h3(i,16)=min(uvl(i),ds(i),bld(i))
h3(i,17)=min(uvl(i),ds(i),lg(i))
h3(i,18)=min(uvl(i),ds(i),ls(i))
h3(i,19)=min(uvl(i),ds(i),mg(i))
h3(i,20)=min(uvl(i),ds(i),ss(i))
h3(i,21)=min(uvl(i),dvs(i),ls(i))
h3(i,22)=min(um(i),ds(i),bld(i))
h3(i,23)=min(um(i),ds(i),lg(i))
h3(i,24)=min(um(i),ds(i),ls(i))
h3(i,25)=min(um(i),ds(i),ss(i))
h3(i,26)=min(um(i),dvs(i),bld(i))
h3(i,27)=min(um(i),dvs(i),lg(i))
h3(i,28)=min(um(i),dvs(i),ss(i))
h3(i,29)=min(um(i),dm(i),ss(i))
m3(i,1)=min(uh(i),dvs(i),ss(i))
m3(i,2)=min(uh(i),dm(i),bld(i))
m3(i,3)=min(ul(i),dd(i),bld(i))
m3(i,4)=min(ul(i),ds(i),fg(i))
m3(i,5)=min(ul(i),dvd(i),ls(i))
m3(i,6)=min(ul(i),dvs(i),bld(i))
m3(i,7)=min(ul(i),dvs(i),mg(i))
m3(i,8)=min(ul(i),dm(i),lg(i))
m3(i,9)=min(uvh(i),ds(i),bld(i))
m3(i,10)=min(uvh(i),dm(i),bld(i))
m3(i,11)=min(uvh(i),dm(i),lg(i))
m3(i,12)=min(uvl(i),dd(i),bld(i))
m3(i,13)=min(uvl(i),ds(i),sand(i))
m3(i,14)=min(uvl(i),dm(i),fg(i))
m3(i,15)=min(uvl(i),dm(i),ls(i))
m3(i,16)=min(uvl(i),dm(i),sand(i))
m3(i,17)=min(um(i),dd(i),ss(i))
m3(i,18)=min(um(i),dd(i),lg(i))
m3(i,19)=min(um(i),ds(i),mg(i))
m3(i,20)=min(um(i),dm(i),lg(i))
p3(i,1)=min(uh(i),dm(i),lg(i))
p3(i,2)=min(ul(i),dd(i),ss(i))
p3(i,3)=min(ul(i),dvd(i),lg(i))
p3(i,4)=min(uvh(i),ds(i),mg(i))
p3(i,5)=min(uvh(i),dvs(i),fg(i))
p3(i,6)=min(uvh(i),dvs(i),sand(i))
p3(i,7)=min(uvh(i),dm(i),ss(i))
p3(i,8)=min(uvl(i),dd(i),ls(i))
p3(i,9)=min(uvl(i),dm(i),mg(i))

high=maxval(h3, dim=2)
good=maxval(g3, dim=2)
moderate=maxval(m3, dim=2)
poor=maxval(p3, dim=2)
bad=maxval(b3, dim=2)
end do

end subroutine sopt
