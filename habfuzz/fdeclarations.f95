module fdeclarations !All constants and variable written in the module to be shared between the program and the subroutines
implicit none

!ALLOCATIION OF MEMORY TO IMPORT DATA FROM 3 INPUT FILES, (1) depths.txt, (2) velocities.txt, (3) substrates.txt AS ARRAYS
real, dimension(:), allocatable :: d !depth
real, dimension(:), allocatable :: u !flow velocity
real, dimension(:), allocatable :: sub !subastrate type
integer :: i,n !To pass through the elements of the arrays

!THIS IS SIZE OF ALL ARRAYS CREATED AND MUST BE RE-DEFINED ACCORDINGLY IF THE NUMBER OF ELEMENTS (NODES OF THE COMPUTATIONAL GRID) EXCEEDS THIS NUMBER
integer, parameter :: rsize = 3000

!PARAMETERS OF THE FUZZIFICATION PROCESS: 
!----------------------------------------
!INPUT 1: Flow velocity (u) - 5 classes, very low, low, moderate, high, very high
real :: uvlow, ulow, umoderate, uhigh, uvhigh
real, dimension(rsize) :: cuvlow, culow, cumoderate, cuhigh, cuvhigh
real, parameter :: uvla = 0.10, uvlb = 0.15 !VERY LOW u class
real, parameter :: ula = 0.10, ulb = 0.15, ulc = 0.27, uld = 0.32 !LOW u class
real, parameter :: uma = 0.27, umb = 0.32, umc = 0.55, umd = 0.60 !MODERATE u class
real, parameter :: uha = 0.55, uhb = 0.60, uhc = 0.95, uhd = 1.00 !HIGH u class
real, parameter :: uvha = 0.95, uvhb = 1.00 !VERY HIGH u class 

!INPUT 2: Depth (d) - 5 classes, very shallow, shallow, moderate, deep, very deep
real :: dvshallow, dshallow, dmoderate, ddeep, dvdeep
real, dimension(rsize) :: cdvshallow, cdshallow, cdmoderate, cddeep, cdvdeep
real, parameter :: dvla = 0.07, dvlb = 0.10 !The VERY SHALLOW d class 
real, parameter :: dla = 0.07, dlb = 0.10, dlc = 0.27, dld = 0.30 !The SHALLOW d class
real, parameter :: dma = 0.27, dmb = 0.30, dmc = 0.57, dmd = 0.60 !The MODERATE d class
real, parameter :: dha = 0.57, dhb = 0.60, dhc = 0.77, dhd = 0.80 !The DEEP d class
real, parameter :: dvha = 0.77, dvhb = 0.80 !The VERY DEEP d class

!INPUT 3: Substrate type - Crisp input, calculated according to the Manning's n for each type.
real, dimension (rsize) :: boulders=0, ls=0, ss=0, lg=0, mg=0, fg=0, sand=0, silt=0

!INTERNAL PARAMETERS TO FACILITATE THE IMPLICATION AND AGGREGATION STEPS
!-----------------------------------------------------------------------
integer :: scenario, dfuzz
real, dimension(rsize) :: high, good, moderate, poor, bad, hs
real, dimension(rsize,4) :: h
real, dimension(rsize,26) :: g
real, dimension(rsize,32) :: m
real, dimension(rsize,11) :: p
real, dimension(rsize,1) :: b
real, dimension(rsize,3) :: h2
real, dimension(rsize,5) :: g2
real, dimension(rsize,28) :: m2
real, dimension(rsize,33) :: p2
real, dimension(rsize,4) :: b2
real, dimension(rsize,29) :: h3
real, dimension(rsize,14) :: g3
real, dimension(rsize,20) :: m3
real, dimension(rsize,9) :: p3
real, dimension(rsize,1) :: b3

!PARAMETERS OF THE DEFUZZIFICATION PROCESS
!-----------------------------------------
real, dimension(rsize) :: suitability
real, dimension(rsize) :: xbad, x1bad, x2bad, xpoor, x1poor, x2poor, xmod, x1mod, x2mod, xgood, x1good, x2good
real, dimension(rsize) :: xhigh, x1high, x2high, ybad, ypoor, ymod, ygood, yhigh, yint
real, dimension(rsize) :: xint, xint2, xint3, xint4, xint5
real :: ba=0, bm=0.5, bb=1, pa=1, pm=1.5, pb=2, ma=2, mm=2.5, mb=3, ga=3, gm=3.5, gb=4, ha=4, hm=4.5, hb=5

end module fdeclarations
