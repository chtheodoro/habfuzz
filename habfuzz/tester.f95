subroutine tester
use fdeclarations

implicit none
open (unit=79, file='testdata.txt', status='old', action='read')
read (79,*) ee

allocate(s(ee,zz))
allocate(cer(ee,zz))
allocate(testmat(ee,w-1))

do i=1,ee
read(79,*) (testmat(i,j), j=1,w-1)
end do

write(*,*) 'MODELLING TEST DATA'
write(*,*) '--------------------'
call sleep(2)

ii=n
dmatrix=matrix
!do i=1,n
!write(*,10) (dmatrix(i,j), j=1,w)
!end do
write(*,*) 'Developing rules database...'
call classifier

open(49, file='log.txt', action='write', status='replace')
write(49,*) ' TEST DATA PARAMETERS'
write(49,*) ' '
write(49,*) ' Classification matrix'
write(49,*) ' V      D      S      T      HS'  
do i=1,ii
write(49,10) (cmatrix(i,j), j=1,w)
end do

!write(49,*) ' '
!write(49,*) 'rmatrix'
!do i=1,e
!write(49,10) (rmatrix(i,j), j=1,w-1)
!end do

call combinations

open (unit=59, file='amatrix.txt', status='old', action='read')
read (59,*) nn

allocate(amatrix(nn,w-1))

do i=1,nn
read(59,*) (amatrix(i,j), j=1,w-1)
end do
if (proc==2) then
call ruler

!write(49,*) ' '
!write(49,*) 'p1matrix'
!do i=1,nn
!write(49,10) (p1matrix(i,j), j=1,w+1)
!end do

write(49,*) ' '
write(49,*) ' Bayesian joint probabilities matrix'
write(49,*) ' H      G      M      P      B'
do i=1,nn
write(49,10) (p2matrix(i,j), j=1,w)
end do

write(*,*) 'Development of rules successful!'
write(*,*) ' '
call sleep(2)

write(*,*) 'Fuzzifying inputs...'

ematrix=testmat
z=ee
call fuzzifier
write(*,*) 'Fuzzification successful!'
write(*,*) ' '

write(*,*) 'Applying Bayesian joint probability rules...'
write(*,*) ' '
call sleep(2)

allocate(bmatrix(e**(w-1),w-1,ee))
allocate(bayh(nn,ee))
allocate(bayg(nn,ee))
allocate(baym(nn,ee))
allocate(bayp(nn,ee))
allocate(bayb(nn,ee))
allocate(fmatrix(nn,w-1,ee))

do i=1,ee
open(29, file='bmatrix.txt', action='write', status='replace')
write(29,*) nn
call permutator
close(29, status='keep')

open (unit=39, file='bmatrix.txt', status='old', action='read')
read (39,*) nn
do jj=1,nn
read(39,*) (fmatrix(jj,j,i), j=1,w-1)
end do
close(39, status='keep')

do j=1,nn
bayh(j,i)=product(fmatrix(j,:,i))*p2matrix(j,1)
bayg(j,i)=product(fmatrix(j,:,i))*p2matrix(j,2)
baym(j,i)=product(fmatrix(j,:,i))*p2matrix(j,3)
bayp(j,i)=product(fmatrix(j,:,i))*p2matrix(j,4)
bayb(j,i)=product(fmatrix(j,:,i))*p2matrix(j,5)
end do
write(*,*) 'Rules application for microhabitat', i, 'successful'
end do
write(*,*) ' '
write(*,*) 'Rules application successful!'
write(*,*) ' '
write(*,*) 'Calculating Bayesian joint probabilities...'
call sleep(2)
!write(49,*) ' '
!write(49,*) 'fmatrix'
!do i=1,nn
!write(49,10) (fmatrix(i,j,jj), j=1,w-1)
!end do
write(*,*) 'Joint probability calculation succesful!'
write(*,*) ' '
print *, 'Calculating suitability...'
call sleep(2)
write(*,*) ' '
do i=1,ee
write(*,*) 'Habitat suitability calculation for test microhabitat', i, 'successful'
bayg1(i)=sum(bayg(1:nn,i))
baym1(i)=sum(baym(1:nn,i))
bayh1(i)=sum(bayh(1:nn,i))
bayp1(i)=sum(bayp(1:nn,i))
bayb1(i)=sum(bayb(1:nn,i))
end do
write(*,*) ' '
write(*,*) 'Habitat suitability calculation successful!'
z=ee
call rules2
!write(49,*) ' '
!write(49,*) 'bayH1'
!do i=1,n
!write(49,10) (bayh1(i))
!end do

!write(49,*) ' '
!write(49,*) 'bayb'
!do i=1,nn
!write(49,10) (bayb(i,j), j=1,n)
!end do

write (49,*) ' '
write (49,*) ' Joint probability of High suitability class'
do i=1,ee
write(49,10) (bayh2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Good suitability class'
do i=1,ee
write(49,10) (bayg2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Moderate suitability class'
do i=1,ee
write(49,10) (baym2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Poor suitability class'
do i=1,ee
write(49,10) (bayp2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Bad suitability class'
do i=1,ee
write(49,10) (bayb2(i))
end do

s(:,:)=0.01
s(0,:)=0.01
do i=1,ee
hs(i)=bhigh(i)+bgood(i)+bmoderate(i)+bpoor(i)+bbad(i)
if (testmat(i,2)>0) then
if (bayg1(i)<=0 .and. bayh1(i)<=0 .and. baym1(i)<=0 .and. bayp1(i)<=0 .and. bayb1(i)<=0) then
s(i,zz)=s(i-1,zz)
cer(i,zz)=0
else
s(i,zz)=hs(i)
cer(i,zz)=1
end if
else
s(i,zz)=0
cer(i,zz)=1
end if
end do

open(19, file='suitability.txt', action='write', status='replace')
do i=1,ee
write(19,10) (s(i,zz))
end do

else if (proc==1) then
l=2
call ftester
end if
10 format (8f7.3)

end subroutine tester
