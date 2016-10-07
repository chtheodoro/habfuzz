subroutine smod
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
b(i,1)=min(uvl(i),dvs(i),sand(i))
g(i,1)=min(uh(i),ds(i),bld(i))
g(i,2)=min(uh(i),ds(i),lg(i))
g(i,3)=min(uh(i),ds(i),ls(i))
g(i,4)=min(uh(i),ds(i),ss(i))
g(i,5)=min(uh(i),dvs(i),ls(i))
g(i,6)=min(uh(i),dm(i),ls(i))
g(i,7)=min(uh(i),dm(i),ss(i))
g(i,8)=min(ul(i),ds(i),bld(i))
g(i,9)=min(ul(i),ds(i),lg(i))
g(i,10)=min(ul(i),ds(i),ls(i))
g(i,11)=min(ul(i),ds(i),mg(i))
g(i,12)=min(ul(i),ds(i),ss(i))
g(i,13)=min(ul(i),dvs(i),lg(i))
g(i,14)=min(ul(i),dvs(i),ls(i))
g(i,15)=min(ul(i),dm(i),ss(i))
g(i,16)=min(uvh(i),ds(i),lg(i))
g(i,17)=min(uvl(i),ds(i),lg(i))
g(i,18)=min(uvl(i),ds(i),ls(i))
g(i,19)=min(uvl(i),ds(i),silt(i))
g(i,20)=min(uvl(i),ds(i),lg(i))
g(i,21)=min(uvl(i),dvs(i),ls(i))
g(i,22)=min(uvl(i),dm(i),lg(i))
g(i,23)=min(um(i),ds(i),lg(i))
g(i,24)=min(um(i),ds(i),ls(i))
g(i,25)=min(um(i),ds(i),ss(i))
g(i,26)=min(um(i),dvs(i),ss(i))
h(i,1)=min(uvh(i),ds(i),ss(i))
h(i,2)=min(um(i),ds(i),bld(i))
h(i,3)=min(um(i),dvs(i),bld(i))
h(i,4)=min(um(i),dvs(i),lg(i))
m(i,1)=min(uh(i),dvs(i),ss(i))
m(i,2)=min(uh(i),dm(i),bld(i))
m(i,3)=min(ul(i),dd(i),bld(i))
m(i,4)=min(ul(i),ds(i),fg(i))
m(i,5)=min(ul(i),dvd(i),ls(i))
m(i,6)=min(ul(i),dvs(i),bld(i))
m(i,7)=min(ul(i),dvs(i),mg(i))
m(i,8)=min(ul(i),dvs(i),ss(i))
m(i,9)=min(ul(i),dm(i),bld(i))
m(i,10)=min(ul(i),dm(i),lg(i))
m(i,11)=min(ul(i),dm(i),ls(i))
m(i,12)=min(uvh(i),ds(i),bld(i))
m(i,13)=min(uvh(i),ds(i),ls(i))
m(i,14)=min(uvh(i),dvs(i),sand(i))
m(i,15)=min(uvh(i),dm(i),lg(i))
m(i,16)=min(uvh(i),dm(i),ls(i))
m(i,17)=min(uvl(i),dd(i),bld(i))
m(i,18)=min(uvl(i),ds(i),bld(i))
m(i,19)=min(uvl(i),ds(i),mg(i))
m(i,20)=min(uvl(i),ds(i),ss(i))
m(i,21)=min(uvl(i),dvs(i),bld(i))
m(i,22)=min(uvl(i),dm(i),bld(i))
m(i,23)=min(uvl(i),dm(i),fg(i))
m(i,24)=min(uvl(i),dm(i),ls(i))
m(i,25)=min(uvl(i),dm(i),sand(i))
m(i,26)=min(um(i),dd(i),ss(i))
m(i,27)=min(um(i),dd(i),lg(i))
m(i,28)=min(um(i),ds(i),mg(i))
m(i,29)=min(um(i),dvs(i),ls(i))
m(i,30)=min(um(i),dm(i),lg(i))
m(i,31)=min(um(i),dm(i),ls(i))
m(i,32)=min(um(i),dm(i),ss(i))
p(i,1)=min(uh(i),dm(i),lg(i))
p(i,2)=min(ul(i),dd(i),ss(i))
p(i,3)=min(ul(i),dvd(i),lg(i))
p(i,4)=min(uvh(i),ds(i),mg(i))
p(i,5)=min(uvh(i),dvs(i),fg(i))
p(i,6)=min(uvh(i),dm(i),bld(i))
p(i,7)=min(uvh(i),dm(i),ss(i))
p(i,8)=min(uvl(i),dd(i),ls(i))
p(i,9)=min(uvl(i),ds(i),fg(i))
p(i,10)=min(uvl(i),ds(i),sand(i))
p(i,11)=min(uvl(i),dm(i),mg(i))

good=maxval(g, dim=2)
moderate=maxval(m, dim=2)
high=maxval(h, dim=2)
poor=maxval(p, dim=2)
bad=maxval(b, dim=2)
end do

end subroutine smod
