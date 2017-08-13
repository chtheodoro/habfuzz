module fdeclarations
implicit none

integer, dimension(:), allocatable :: a, bins, iimatrix, a1
real, dimension(:), allocatable :: icci
integer :: z,zz,ff,i,n,k,j,jj,e,ee,f,nn,ii,col1,col2,col3,col4,l,o,v
real, dimension(:,:), allocatable :: matrix, cmatrix, rmatrix, amatrix, pmatrix, p1matrix, &
p2matrix, p22matrix, uf, df, tf, sf, imatrix, dmatrix, ematrix, suitability, testmat, s, &
co1matrix, aa, cer
real, dimension(:,:,:), allocatable :: bmatrix, fmatrix, mmatrix, p11matrix, comatrix

!The maximum array size - this should be re-defined if the elements of the input arrays exceed 3000
integer, parameter :: rsize = 5170, w = 5

!------------------------------------------------------------------------------------------------!
!Trapezoidal-shaped membership functions for flow velocity (V), water depth (D), temperature (T) !
!------------------------------------------------------------------------------------------------!
!FLOW VELOCITY                                                                                   !                                                                     !
real, parameter :: uvla = 0.05, uvlb = 0.10                       !VERY LOW V class              !
real, parameter :: ula = 0.05, ulb = 0.10, ulc = 0.15, uld = 0.20 !LOW V class                   !
real, parameter :: uma = 0.15, umb = 0.20, umc = 0.40, umd = 0.50 !MODERATE V class              !
real, parameter :: uha = 0.40, uhb = 0.50, uhc = 0.70, uhd = 0.80 !HIGH V class                  !
real, parameter :: uvha = 0.7, uvhb = 0.80                        !VERY HIGH V class             !
!------------------------------------------------------------------------------------------------!
!WATER DEPTH                                                                                     !                                                                        !
real, parameter :: dvla = 0.10, dvlb = 0.15                       !The VERY SHALLOW D class      !
real, parameter :: dla = 0.15, dlb = 0.20, dlc = 0.30, dld = 0.35 !The SHALLOW D class           !
real, parameter :: dma = 0.30, dmb = 0.35, dmc = 0.55, dmd = 0.60 !The MODERATE D class          !
real, parameter :: dda = 0.55, ddb = 0.60, ddc = 0.70, ddd = 0.75 !The DEEP D class              !
real, parameter :: dvda = 0.75, dvdb = 0.80                       !The VERY DEEP D class         !
!------------------------------------------------------------------------------------------------!                                                                                    !
!TEMPERATURE                                                                                     !
real, parameter :: tvla = 9, tvlb = 10                           !The VERY LOW T class           !
real, parameter :: tla = 9, tlb = 10, tlc = 13, tld = 15         !The LOW T class                !
real, parameter :: tma = 13, tmb = 15, tmc = 17, tmd = 19         !The MODERATE T class          !
real, parameter :: tha = 19, thb = 20, thc = 23, thd = 25         !The HIGH T class              !
real, parameter :: tvha = 25, tvhb = 27                           !The VERY HIGH T class         !
!------------------------------------------------------------------------------------------------!

!Internal variables
real, dimension(rsize) :: uvl, ul, um, uh, uvh
real :: ucl1, ucl2, ucl3, ucl4, dcl1, dcl2, dcl3, dcl4, tcl1, tcl2, tcl3, tcl4, osi, nosi, cci
real, dimension(rsize) :: dvs, ds, dm, dd, dvd
real, dimension(rsize) :: tvl, tl, tm, th, tvh
integer :: proc, scenario, dfuzz, cert, habc, haba, cross
real, dimension(rsize) :: hs
real, dimension(rsize) :: bhigh, bgood, bmoderate, bpoor, bbad, bayhs
real, dimension(rsize) :: bayh1, bayg1, baym1, bayp1, bayb1
real, dimension(rsize) :: bayh2, bayg2, baym2, bayp2, bayb2
real, dimension(:,:), allocatable :: bayh, bayg, baym, bayp, bayb
real, dimension(:), allocatable :: high, good, moderate, poor, bad, cs, habcon, gwet 

!Variables of the defuzzification process
real, dimension(rsize) :: xbad, x1bad, x2bad, xpoor, x1poor, x2poor, xmod, x1mod, x2mod, xgood, x1good, x2good
real, dimension(rsize) :: xhigh, x1high, x2high, ybad, ypoor, ymod, ygood, yhigh, yint
real, dimension(rsize) :: xint, xint2, xint3, xint4, xint5
real :: ba=0, bm=0.5, bb=1, pa=1, pm=1.5, pb=2, ma=2, mm=2.5, mb=3, ga=3, gm=3.5, gb=4, ha=4, hm=4.5, hb=5

end module fdeclarations
