module fdeclarations !All parameters and variables are included in the module to be shared between the program and the subroutines
implicit none

!Memory allocation to import data from the 3 input files (1) depths.txt, (2) velocities.txt, (3) substrates.txt as arrays
real, dimension(:), allocatable :: d !depth
real, dimension(:), allocatable :: u !flow velocity
real, dimension(:), allocatable :: sub !substrate type
integer :: i,n !To pass through the elements of the arrays

!The maximum array size - this should be re-defined if the elements of the input arrays exceed 3000
integer, parameter :: rsize = 3000

!--------------------------------------------------------------------------------------------!
!Trapezoidal-shaped membership functions for flow velocity (V) and water depth (D)           !
!--------------------------------------------------------------------------------------------!
!FLOW VELOCITY                                                                               !                                                                     !
real, parameter :: uvla = 0.10, uvlb = 0.15                       !VERY LOW V class          !
real, parameter :: ula = 0.10, ulb = 0.15, ulc = 0.27, uld = 0.32 !LOW V class               !
real, parameter :: uma = 0.27, umb = 0.32, umc = 0.55, umd = 0.60 !MODERATE V class          !
real, parameter :: uha = 0.55, uhb = 0.60, uhc = 0.95, uhd = 1.00 !HIGH V class              !
real, parameter :: uvha = 0.95, uvhb = 1.00                       !VERY HIGH V class         !
!--------------------------------------------------------------------------------------------!
!WATER DEPTH                                                                                 !                                                                        !
real, parameter :: dvla = 0.07, dvlb = 0.10                       !The VERY SHALLOW D class  !
real, parameter :: dla = 0.07, dlb = 0.10, dlc = 0.27, dld = 0.30 !The SHALLOW D class       !
real, parameter :: dma = 0.27, dmb = 0.30, dmc = 0.57, dmd = 0.60 !The MODERATE D class      !
real, parameter :: dda = 0.57, ddb = 0.60, ddc = 0.77, ddd = 0.80 !The DEEP D class          !
real, parameter :: dvda = 0.77, dvdb = 0.80                       !The VERY DEEP D class     !
!--------------------------------------------------------------------------------------------!

!INPUT 3: Substrate type (S) - Crisp input, calculated according to the Manning's n for each type.
real, dimension (rsize) :: bld=0, ls=0, ss=0, lg=0, mg=0, fg=0, sand=0, silt=0

!Internal variables
real :: uvlow, ulow, umoderate, uhigh, uvhigh
real, dimension(rsize) :: uvl, ul, um, uh, uvh
real :: dvshallow, dshallow, dmoderate, ddeep, dvdeep
real, dimension(rsize) :: dvs, ds, dm, dd, dvd
integer :: proc, scenario, dfuzz
real, dimension(rsize) :: high, good, moderate, poor, bad, hs
real, dimension(rsize) :: bhigh, bgood, bmoderate, bpoor, bbad, bayhs, bayh1, bayg1, baym1, bayp1, bayb1
real, dimension(rsize) :: bayh2, bayg2, baym2, bayp2, bayb2

!Used by smod.f95
real, dimension(rsize,4) :: h
real, dimension(rsize,26) :: g
real, dimension(rsize,32) :: m
real, dimension(rsize,11) :: p
real, dimension(rsize,1) :: b

!Used by swors.f95
real, dimension(rsize,3) :: h2
real, dimension(rsize,5) :: g2
real, dimension(rsize,28) :: m2
real, dimension(rsize,33) :: p2
real, dimension(rsize,4) :: b2

!Used by sopt.f95
real, dimension(rsize,29) :: h3
real, dimension(rsize,14) :: g3
real, dimension(rsize,20) :: m3
real, dimension(rsize,9) :: p3
real, dimension(rsize,1) :: b3

!Used by rules.f95
real, dimension(rsize,30) :: bayh
real, dimension(rsize,37) :: bayg
real, dimension(rsize,48) :: baym
real, dimension(rsize,33) :: bayp
real, dimension(rsize,6) :: bayb

!Variables of the defuzzification process
real, dimension(rsize) :: xbad, x1bad, x2bad, xpoor, x1poor, x2poor, xmod, x1mod, x2mod, xgood, x1good, x2good
real, dimension(rsize) :: xhigh, x1high, x2high, ybad, ypoor, ymod, ygood, yhigh, yint
real, dimension(rsize) :: xint, xint2, xint3, xint4, xint5
real :: ba=0, bm=0.5, bb=1, pa=1, pm=1.5, pb=2, ma=2, mm=2.5, mb=3, ga=3, gm=3.5, gb=4, ha=4, hm=4.5, hb=5
real, dimension(rsize) :: suitability

end module fdeclarations
