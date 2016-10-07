subroutine rules
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
bayb(i,1)=uvl(i)*dvs(i)*sand(i)*1
bayb(i,2)=uvl(i)*ds(i)*ss(i)*0.0625
bayb(i,3)=uvl(i)*dm(i)*bld(i)*0.1435
bayb(i,4)=ul(i)*ds(i)*bld(i)*0.09
bayb(i,5)=uvh(i)*ds(i)*lg(i)*0.25
bayb(i,6)=uvh(i)*dm(i)*bld(i)*0.5
bayg(i,1)=uvl(i)*dvs(i)*bld(i)*0.33334
bayg(i,2)=uvl(i)*dvs(i)*ls(i)*0.5
bayg(i,3)=uvl(i)*ds(i)*bld(i)*0.44
bayg(i,4)=uvl(i)*ds(i)*ls(i)*0.192
bayg(i,5)=uvl(i)*ds(i)*ss(i)*0.25
bayg(i,6)=uvl(i)*ds(i)*lg(i)*0.5
bayg(i,7)=uvl(i)*ds(i)*mg(i)*0.1667
bayg(i,8)=uvl(i)*ds(i)*fg(i)*0.25
bayg(i,9)=uvl(i)*dm(i)*bld(i)*0.285
bayg(i,10)=ul(i)*dvs(i)*ss(i)*0.3334
bayg(i,11)=ul(i)*dvs(i)*lg(i)*0.7
bayg(i,12)=ul(i)*ds(i)*bld(i)*0.274
bayg(i,13)=ul(i)*ds(i)*ls(i)*0.424
bayg(i,14)=ul(i)*ds(i)*ss(i)*0.527
bayg(i,15)=ul(i)*ds(i)*lg(i)*0.369
bayg(i,16)=ul(i)*ds(i)*mg(i)*0.25
bayg(i,17)=ul(i)*dm(i)*bld(i)*0.5
bayg(i,18)=ul(i)*dm(i)*ls(i)*0.2
bayg(i,19)=ul(i)*dm(i)*ss(i)*0.3334
bayg(i,20)=um(i)*dvs(i)*ls(i)*0.5
bayg(i,21)=um(i)*dvs(i)*ss(i)*0.572
bayg(i,22)=um(i)*dvs(i)*lg(i)*0.667
bayg(i,23)=um(i)*ds(i)*ls(i)*0.584
bayg(i,24)=um(i)*ds(i)*ss(i)*0.5555
bayg(i,25)=um(i)*ds(i)*lg(i)*0.4167
bayg(i,26)=um(i)*dm(i)*ls(i)*0.5
bayg(i,27)=um(i)*dm(i)*ss(i)*0.286
bayg(i,28)=um(i)*dvs(i)*ls(i)*0.5
bayg(i,29)=uh(i)*ds(i)*bld(i)*0.3334
bayg(i,30)=uh(i)*ds(i)*ls(i)*0.5
bayg(i,31)=uh(i)*ds(i)*ss(i)*0.2
bayg(i,32)=uh(i)*ds(i)*lg(i)*0.5
bayg(i,33)=uh(i)*dm(i)*ls(i)*1
bayg(i,34)=uh(i)*dm(i)*ss(i)*0.5
bayg(i,35)=uvh(i)*dvs(i)*sand(i)*0.5
bayg(i,36)=uvh(i)*ds(i)*lg(i)*0.75
bayg(i,37)=uvh(i)*dm(i)*ls(i)*0.25
bayh(i,1)=uvl(i)*dvs(i)*ls(i)*0.25
bayh(i,2)=uvl(i)*ds(i)*bld(i)*0.28
bayh(i,3)=uvl(i)*ds(i)*ls(i)*0.269
bayh(i,4)=uvl(i)*ds(i)*ss(i)*0.625
bayh(i,5)=uvl(i)*ds(i)*lg(i)*0.3334
bayh(i,6)=uvl(i)*ds(i)*mg(i)*0.1667
bayh(i,7)=ul(i)*dvs(i)*ls(i)*1
bayh(i,8)=ul(i)*dvs(i)*lg(i)*0.2
bayh(i,9)=ul(i)*ds(i)*bld(i)*0.546
bayh(i,10)=ul(i)*ds(i)*ls(i)*0.192
bayh(i,11)=ul(i)*ds(i)*ss(i)*0.368
bayh(i,12)=ul(i)*ds(i)*lg(i)*0.263
bayh(i,13)=ul(i)*ds(i)*mg(i)*0.25
bayh(i,14)=ul(i)*dm(i)*ls(i)*0.1
bayh(i,15)=ul(i)*dm(i)*ss(i)*0.3334
bayh(i,16)=um(i)*dvs(i)*bld(i)*1
bayh(i,17)=um(i)*dvs(i)*ss(i)*0.285
bayh(i,18)=um(i)*dvs(i)*lg(i)*0.3334
bayh(i,19)=um(i)*ds(i)*bld(i)*1
bayh(i,20)=um(i)*ds(i)*ls(i)*0.25
bayh(i,21)=um(i)*ds(i)*ss(i)*0.3334
bayh(i,22)=um(i)*ds(i)*lg(i)*0.3334
bayh(i,23)=um(i)*dm(i)*ss(i)*0.142
bayh(i,24)=uh(i)*dvs(i)*ls(i)*0.5
bayh(i,25)=uh(i)*ds(i)*bld(i)*0.3334
bayh(i,26)=uh(i)*ds(i)*ls(i)*0.25
bayh(i,27)=uh(i)*ds(i)*ss(i)*0.4
bayh(i,28)=uvh(i)*ds(i)*ls(i)*0.3334
bayh(i,29)=uvh(i)*ds(i)*ss(i)*1
bayh(i,30)=uvh(i)*dm(i)*ls(i)*0.25
baym(i,1)=uvl(i)*dvs(i)*bld(i)*0.3334
baym(i,2)=uvl(i)*dvs(i)*ls(i)*0.25
baym(i,3)=uvl(i)*ds(i)*bld(i)*0.23
baym(i,4)=uvl(i)*ds(i)*ls(i)*0.461
baym(i,5)=uvl(i)*ds(i)*ss(i)*0.375
baym(i,6)=uvl(i)*ds(i)*lg(i)*0.167
baym(i,7)=uvl(i)*ds(i)*mg(i)*0.1667
baym(i,8)=uvl(i)*ds(i)*fg(i)*0.25
baym(i,9)=uvl(i)*ds(i)*sand(i)*1
baym(i,10)=uvl(i)*dm(i)*bld(i)*0.1435
baym(i,11)=uvl(i)*dm(i)*ls(i)*0.5
baym(i,12)=uvl(i)*dm(i)*fg(i)*1
baym(i,13)=uvl(i)*dm(i)*sand(i)*1
baym(i,14)=uvl(i)*dd(i)*bld(i)*0.667
baym(i,15)=ul(i)*dvs(i)*bld(i)*1
baym(i,16)=ul(i)*dvs(i)*ss(i)*0.667
baym(i,17)=ul(i)*dvs(i)*mg(i)*1
baym(i,18)=ul(i)*ds(i)*bld(i)*0.09
baym(i,19)=ul(i)*ds(i)*ls(i)*0.307
baym(i,20)=ul(i)*ds(i)*ss(i)*0.105
baym(i,21)=ul(i)*ds(i)*lg(i)*0.263
baym(i,22)=ul(i)*ds(i)*mg(i)*0.5
baym(i,23)=ul(i)*ds(i)*fg(i)*0.5
baym(i,24)=ul(i)*dm(i)*bld(i)*0.5
baym(i,25)=ul(i)*dm(i)*ls(i)*0.4
baym(i,26)=ul(i)*dm(i)*ss(i)*0.3334
baym(i,27)=ul(i)*dm(i)*lg(i)*0.5
baym(i,28)=ul(i)*dd(i)*bld(i)*1
baym(i,29)=ul(i)*dvd(i)*ls(i)*1
baym(i,30)=um(i)*dvs(i)*ss(i)*0.143
baym(i,31)=um(i)*ds(i)*ls(i)*0.166
baym(i,32)=um(i)*ds(i)*ss(i)*0.1112
baym(i,33)=um(i)*ds(i)*lg(i)*0.25
baym(i,34)=um(i)*ds(i)*mg(i)*1
baym(i,35)=um(i)*dm(i)*ss(i)*0.286
baym(i,36)=um(i)*dm(i)*lg(i)*1
baym(i,37)=um(i)*dd(i)*ls(i)*1
baym(i,38)=um(i)*dd(i)*lg(i)*1
baym(i,39)=uh(i)*dvs(i)*ss(i)*1
baym(i,40)=uh(i)*ds(i)*bld(i)*0.3334
baym(i,41)=uh(i)*ds(i)*ls(i)*0.125
baym(i,42)=uh(i)*ds(i)*ss(i)*0.2
baym(i,43)=uh(i)*ds(i)*lg(i)*0.5
baym(i,44)=uh(i)*dm(i)*bld(i)*1
baym(i,45)=uh(i)*dm(i)*ss(i)*0.5
baym(i,46)=uvh(i)*ds(i)*bld(i)*0.5
baym(i,47)=uvh(i)*ds(i)*ls(i)*0.3334
baym(i,48)=uvh(i)*dm(i)*lg(i)*1
bayp(i,1)=uvl(i)*dvs(i)*bld(i)*0.3334
bayp(i,2)=uvl(i)*ds(i)*bld(i)*0.05
bayp(i,3)=uvl(i)*ds(i)*ls(i)*0.078
bayp(i,4)=uvl(i)*ds(i)*ss(i)*0.25
bayp(i,5)=uvl(i)*ds(i)*mg(i)*0.5
bayp(i,6)=uvl(i)*ds(i)*fg(i)*0.5
bayp(i,7)=uvl(i)*dm(i)*bld(i)*0.428
bayp(i,8)=uvl(i)*dm(i)*ls(i)*0.5
bayp(i,9)=uvl(i)*dm(i)*mg(i)*1
bayp(i,10)=uvl(i)*dd(i)*bld(i)*0.3334
bayp(i,11)=uvl(i)*dd(i)*ls(i)*1
bayp(i,12)=ul(i)*dvs(i)*lg(i)*0.1
bayp(i,13)=ul(i)*ds(i)*ls(i)*0.77
bayp(i,14)=ul(i)*ds(i)*lg(i)*0.105
bayp(i,15)=ul(i)*ds(i)*fg(i)*0.5
bayp(i,16)=ul(i)*dm(i)*ls(i)*0.3
bayp(i,17)=ul(i)*dm(i)*lg(i)*0.5
bayp(i,18)=ul(i)*dd(i)*ss(i)*1
bayp(i,19)=ul(i)*dvd(i)*lg(i)*1
bayp(i,20)=um(i)*dvs(i)*ls(i)*0.5
bayp(i,21)=um(i)*dm(i)*ls(i)*0.5
bayp(i,22)=um(i)*dm(i)*ss(i)*0.286
bayp(i,23)=uh(i)*ds(i)*ls(i)*0.125
bayp(i,24)=uh(i)*ds(i)*ss(i)*0.2
bayp(i,25)=uh(i)*dm(i)*lg(i)*1
bayp(i,26)=uvh(i)*dvs(i)*fg(i)*1
bayp(i,27)=uvh(i)*dvs(i)*sand(i)*0.5
bayp(i,28)=uvh(i)*ds(i)*bld(i)*0.5
bayp(i,29)=uvh(i)*ds(i)*ls(i)*0.3334
bayp(i,30)=uvh(i)*ds(i)*mg(i)*1
bayp(i,31)=uvh(i)*dm(i)*bld(i)*0.5
bayp(i,32)=uvh(i)*dm(i)*ls(i)*0.5
bayp(i,33)=uvh(i)*dm(i)*ss(i)*1

bayg1=sum(bayg, dim=2)
baym1=sum(baym, dim=2)
bayh1=sum(bayh, dim=2)
bayp1=sum(bayp, dim=2)
bayb1=sum(bayb, dim=2)

bgood=0.7*bayg1
bmoderate=0.5*baym1
bhigh=0.9*bayh1
bpoor=0.3*bayp1
bbad=0.1*bayb1
end do

end subroutine rules
