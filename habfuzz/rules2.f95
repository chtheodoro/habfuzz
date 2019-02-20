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

bgood=eud*bayg2
bmoderate=euc*baym2
bhigh=eue*bayh2
bpoor=eub*bayp2
bbad=eua*bayb2

end subroutine rules2
