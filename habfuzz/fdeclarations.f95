module fdeclarations
implicit none

integer, dimension(:), allocatable :: a, bins, iimatrix, a1
real, dimension(:), allocatable :: icci
integer :: z,zz,ff,i,n,k,j,jj,e,ee,f,nn,ii,col1,col2,col3,col4,l,o,v,ik
real, dimension(:,:), allocatable :: bayh, bayg, baym, bayp, bayb, &
c1matrix, c2matrix, matrix, cmatrix, rmatrix, amatrix, pmatrix, p1matrix, &
p2matrix, p22matrix, uf, df, tf, sf, imatrix, dmatrix, ematrix, suitability, testmat, s, &
co1matrix, aa, cer
real, dimension(:,:,:), allocatable :: bmatrix, fmatrix, mmatrix, p11matrix, comatrix
real :: ta, tb
real :: uvla,uvlb,ula,ulb,ulc,uld,uma,umb,umc,umd,uha,uhb,uhc,uhd,uvha, &
uvhb,dvla,dvlb,dla,dlb,dlc,dld,dma,dmb,dmc,dmd,dda,ddb,ddc,ddd,dvda,dvdb,boulders, &
large_stones,small_stones,large_gravel,medium_gravel,fine_gravel,sand,silt,tvla,tvlb, &
svla,svlb,sla,slb,slc,sld,sma,smb,smc,smd,sda,sdb,sdc,sdd,svda,svdb, &
tla,tlb,tlc,tld,tma,tmb,tmc,tmd,tha,thb,thc,thd,tvha,tvhb

!The maximum array size - this should be re-defined if the elements of the input arrays exceed 3000
integer, parameter :: rsize = 50000, w = 5
!RESPONSE VARIABLE 5-CLASS VALUES
real, parameter :: ka = 0.2, kb = 0.4, kc = 0.6, kd = 0.8
!EXPECTED UTILITY VALUES FOR RULES2.F95
real, parameter :: eua = 0.1, eub = 0.3, euc = 0.5, eud = 0.7, eue = 0.9

!Internal variables
real, dimension(rsize) :: uvl, ul, um, uh, uvh
real :: ucl1, ucl2, ucl3, ucl4, dcl1, dcl2, dcl3, dcl4, tcl1, tcl2, tcl3, tcl4, osi, nosi, cci, pwet, &
scl1, scl2, scl3, scl4
real, dimension(rsize) :: dvs, ds, dm, dd, dvd
real, dimension(rsize) :: svs, ss, sm, sd, svd
real, dimension(rsize) :: tvl, tl, tm, th, tvh
integer :: start, proc, scenario, dfuzz, cert, habc, haba, cross, vers
real, dimension(rsize) :: hs
real, dimension(rsize) :: bhigh, bgood, bmoderate, bpoor, bbad, bayhs
real, dimension(rsize) :: bayh1, bayg1, baym1, bayp1, bayb1
real, dimension(rsize) :: bayh2, bayg2, baym2, bayp2, bayb2
real, dimension(rsize) :: ab, ap, am, ag, ah, cb, cp, cm, cg, ch
real, dimension(:), allocatable :: tbayh, tbayg, tbaym, tbayp, tbayb
real, dimension(:), allocatable :: high, good, moderate, poor, bad, cs, habcon, gwet, wet 

!Variables of the defuzzification process
real, dimension(rsize) :: xbad, x1bad, x2bad, xpoor, x1poor, x2poor, xmod, x1mod, x2mod, xgood, x1good, x2good
real, dimension(rsize) :: xhigh, x1high, x2high, ybad, ypoor, ymod, ygood, yhigh, yint
real, dimension(rsize) :: xint, xint2, xint3, xint4, xint5
real, dimension(rsize) :: a1b, a2b, a3b, a1p, a2p, a3p, a4p, a5p, a1m, a2m, a3m, a4m, a5m, a1g, a2g, a3g, a4g, a5g, a1h, a2h, a3h
real, dimension(rsize) :: c1b, c2b, c3b, c1p, c2p, c3p, c4p, c5p, c1m, c2m, c3m, c4m, c5m, c1g, c2g, c3g, c4g, c5g, c1h, c2h, c3h
real, dimension(rsize) :: ibp, ipm, img, igh, actb, actp, actm, actg, acth, atb, atp, atm, atg, ath, ibpx, ipmx, imgx, ighx
real, dimension(rsize) :: interb, interp1, interp2, interm1, interm2, interg1, interg2, interh
real, dimension(rsize) :: slopeb, slopeh, slopep1, slopep2, slopem1, slopem2, slopeg1, slopeg2
real :: ba=0, bm=0.5, bb=1, pa=1, pm=1.5, pb=2, ma=2, mm=2.5, mb=3, ga=3, gm=3.5, gb=4, ha=4, hm=4.5, hb=5

end module fdeclarations
