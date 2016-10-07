module hdeclarations !All constants and variable written in the module to be shared between the program and the subroutines
implicit none

!ALLOCATIION OF MEMORY TO IMPORT DATA FROM the 3 INPUT FILES, (1) depths.txt, (2) velocities.txt, (3) substrates.txt AS ARRAYS
real, dimension(:), allocatable :: d !depth
real, dimension(:), allocatable :: u !flow velocity
real, dimension(:), allocatable :: sub !substrate type
integer :: i,n !To pass through the elements of the arrays

!THIS IS SIZE OF ALL ARRAYS CREATED AND MUST BE RE-DEFINED ACCORDINGLY IF THE NUMBER OF ELEMENTS (NODES OF THE COMPUTATIONAL GRID) EXCEEDS THIS NUMBER
integer, parameter :: rsize = 3000

!PARAMETERS OF THE FUZZIFICATION PROCESS:
!----------------------------------------
!INPUT 1: Flow velocity (u) - 5 classes, very low, low, moderate, high, very high
real :: uvlow, ulow, umoderate, uhigh, uvhigh
real, dimension(rsize) :: cuvlow, culow, cumoderate, cuhigh, cuvhigh
real, parameter :: uvla = 0.10, uvlb = 0.15 !VERY LOW V class
real, parameter :: ula = 0.10, ulb = 0.15, ulc = 0.27, uld = 0.32 !LOW V class
real, parameter :: uma = 0.27, umb = 0.32, umc = 0.55, umd = 0.60 !MODERATE V class
real, parameter :: uha = 0.55, uhb = 0.60, uhc = 0.95, uhd = 1.00 !HIGH V class
real, parameter :: uvha = 0.95, uvhb = 1.00 !VERY HIGH V class

!INPUT 2: Depth (d) - 5 classes, very shallow, shallow, moderate, deep, very deep
real :: dvshallow, dshallow, dmoderate, ddeep, dvdeep
real, dimension(rsize) :: cdvshallow, cdshallow, cdmoderate, cddeep, cdvdeep
real, parameter :: dvla = 0.07, dvlb = 0.10 !The VERY SHALLOW D class
real, parameter :: dla = 0.07, dlb = 0.10, dlc = 0.27, dld = 0.30 !The SHALLOW D class
real, parameter :: dma = 0.27, dmb = 0.30, dmc = 0.57, dmd = 0.60 !The MODERATE D class
real, parameter :: dha = 0.57, dhb = 0.60, dhc = 0.77, dhd = 0.80 !The DEEP D class
real, parameter :: dvha = 0.77, dvhb = 0.80 !The VERY DEEP D class

!INPUT 3: Substrate type - Crisp input, calculated according to the Manning's n for each type.
real, dimension (rsize) :: boulders=0, ls=0, ss=0, lg=0, mg=0, fg=0, sand=0, silt=0

real, dimension(rsize) :: high, good, moderate, poor, bad, hs, h, g, m, p, b
real, dimension(rsize,30) :: h
real, dimension(rsize,37) :: g
real, dimension(rsize,48) :: m
real, dimension(rsize,33) :: p
real, dimension(rsize,6) :: b

real, dimension(rsize) :: suitability

end module hdeclarations
