subroutine rules2
use fdeclarations

implicit none
do i=1,z
bayh2(i)=bayh1(i)/(bayh1(i)+bayg1(i)+baym1(i)+bayp1(i)+bayb1(i))
bayg2(i)=bayg1(i)/(bayh1(i)+bayg1(i)+baym1(i)+bayp1(i)+bayb1(i))
baym2(i)=baym1(i)/(bayh1(i)+bayg1(i)+baym1(i)+bayp1(i)+bayb1(i))
bayp2(i)=bayp1(i)/(bayh1(i)+bayg1(i)+baym1(i)+bayp1(i)+bayb1(i))
bayb2(i)=bayb1(i)/(bayh1(i)+bayg1(i)+baym1(i)+bayp1(i)+bayb1(i))
end do

bgood=0.7*bayg2
bmoderate=0.5*baym2
bhigh=0.9*bayh2
bpoor=0.3*bayp2
bbad=0.1*bayb2

end subroutine rules2
