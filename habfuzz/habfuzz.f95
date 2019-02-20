!HABFUZZ+ 2.3
!Copyright © 2017 Christos Theodoropoulos
    
!Licensed under the Apache License, Version 2.0 (the "License");
!you may not use this file except in compliance with the License.
!You may obtain a copy of the License at

!http://www.apache.org/licenses/LICENSE-2.0

!Unless required by applicable law or agreed to in writing, software
!distributed under the License is distributed on an "AS IS" BASIS,
!WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
!See the License for the specific language governing permissions and
!limitations under the License.

program habfuzz
use fdeclarations

implicit none

write(*,*)
write(*,*) '@@   @@   @@@@@   @@@@@   @@@@@@  @@    @@  @@@@@@  @@@@@@ '
write(*,*) '@@   @@  @@   @@  @@  @@  @@      @@    @@     @@      @@ '   
write(*,*) '@@@@@@@  @@@@@@@  @@@@@   @@@@@   @@    @@    @@      @@ '
write(*,*) '@@@@@@@  @@@@@@@  @@@@@   @@@@@   @@    @@   @@      @@ '
write(*,*) '@@   @@  @@   @@  @@  @@  @@      @@    @@  @@      @@ '
write(*,*) '@@   @@  @@   @@  @@@@@   @@       @@@@@@   @@@@@@  @@@@@@'
write(*,*) ' '
write(*,*) 'A COMMAND-LINE TOOL FOR DATA-DRIVEN FUZZY HABITAT MODELLING'
write(*,*) ' '
write(*,*) 'HABFUZZ requires two inputs'
write(*,*) '-----------------------------'
write(*,*) '1. A training dataset with observations of known response variable' 
write(*,*) '2. A test dataset with observtions of unknown response variable'
write(*,*) 'The response variable in the test dataset will be predicted'
write(*,*) 'based on fuzzy rule-based algorithms and will be'
write(*,*) 'exported in the suitability.txt file'
write(*,*) '----------------------------------------------'
write(*,*) 'You can run the software without any prior knowledge but it would' 
write(*,*) 'be wise to consult the manual before running HABFUZZ.'
write(*,*) 'If you need assistance just contact us at ctheodor@hcmr.gr'
write(*,*) '----------------------'
write(*,*) 'Press ENTER to start'
read(*,*)

!Opening the data to develop the rules
open (unit=99, file='traindata.txt', status='old', action='read') !The data matrix
read (99,*) n
open (unit=89, file='refdata.txt', status='old', action='read') !The reference data matrix to acquire all class combinations
read (89,*) e

allocate(rmatrix(e,w-1)) !Allocate the data matrix
allocate(matrix(n,w)) !Allocate the reference data matrix
allocate(cmatrix(n,w)) !This initiates the matrix where the train data are classified row by row
o=90*n
if (mod(o,100)==0) then
ii=o/100
else
ii=int(o)/100
end if
z=n-ii
allocate(a1(n*10))
allocate(suitability(z,10))
allocate(aa(z,10))
allocate(comatrix(z,3,10))
comatrix(:,:,:)=0
allocate(co1matrix(z,10))
allocate(icci(10))
l=1
do i=1,n
read(99,*) (matrix(i,j), j=1,w)
end do
do i=1,e
read(89,*) (rmatrix(i,j), j=1,w-1)
end do

print *, 'Select modelling method'
print *, '[1] Fuzzy logic algorithms'
print *, '[2] Fuzzy Bayesian algorithm'
read *, proc
print *, ' '
print *, 'Select cross-validation scheme'
print *, '[1] Monte Carlo'
print *, '[2] Ten fold'
read *, cross

if (proc==1) then
call fuzzy
else

if (cross==1) then
write(*,*) ' '
write(*,*) 'Initializing fuzzy Bayesian inference...'
call sleep(2)
do zz=1,10
write(*,*) ' '
write(*,*) 'ITERATION', zz
write(*,*) '----------------------'
call sleep(2)
call randomizer
call iterator

write(*,*) 'Developing rules database...'
call classifier

open(49, file='log.txt', action='write', status='replace')
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
call fuzzifier
!write(49,*) ' '
!write(49,*) 'V Fuzzification'
!do i=1,n
!write(49,10) (uf(i,j), j=1,e)
!end do

!write(49,*) ' '
!write(49,*) 'D Fuzzification'
!do i=1,n
!write(49,10) (df(i,j), j=1,e)
!end do

!write(49,*) ' '
!write(49,*) 'S Classes'
!do i=1,n
!write(49,10) (sf(i,j), j=1,e)
!end do

!write(49,*) ' '
!write(49,*) 'T Fuzzification'
!do i=1,n
!write(49,10) (tf(i,j), j=1,e)
!end do
write(*,*) 'Fuzzification successful!'
write(*,*) ' '

write(*,*) 'Applying Bayesian joint probability rules...'
write(*,*) ' '
call sleep(2)
allocate(bmatrix(e**(w-1),w-1,z))
allocate(bayh(nn,z))
allocate(bayg(nn,z))
allocate(baym(nn,z))
allocate(bayp(nn,z))
allocate(bayb(nn,z))
allocate(fmatrix(nn,w-1,z))

do i=1,z
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
write(*,*) 'Joint probability calculation successful!'
write(*,*) ' '
print *, 'Calculating suitability...'
call sleep(2)
write(*,*) ' '
do i=1,z
write(*,*) 'Habitat suitability calculation for microhabitat', i, 'successful'
bayg1(i)=sum(bayg(1:nn,i))
baym1(i)=sum(baym(1:nn,i))
bayh1(i)=sum(bayh(1:nn,i))
bayp1(i)=sum(bayp(1:nn,i))
bayb1(i)=sum(bayb(1:nn,i))
end do
write(*,*) ' '
write(*,*) 'Habitat suitability calculation successful!'

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
do i=1,z
write(49,10) (bayh2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Good suitability class'
do i=1,z
write(49,10) (bayg2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Moderate suitability class'
do i=1,z
write(49,10) (baym2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Poor suitability class'
do i=1,z
write(49,10) (bayp2(i))
end do

write (49,*) ' '
write (49,*) ' Joint probability of Bad suitability class'
do i=1,z
write(49,10) (bayb2(i))
end do

do i=1,z
hs(i)=bhigh(i)+bgood(i)+bmoderate(i)+bpoor(i)+bbad(i)
if (bayg1(i)<=0 .and. bayh1(i)<=0 .and. baym1(i)<=0 .and. bayp1(i)<=0 .and. bayb1(i)<=0) then
suitability(i,zz)=suitability(i-1,zz)
else
suitability(i,zz)=hs(i)
end if
end do

!open(19, file='suitability.txt', action='write', status='replace')
!do i=1,z
!write(*,10) (suitability(i,zz))
!end do
!read(*,*)
deallocate(a)
deallocate(bins)
deallocate(iimatrix)
deallocate(amatrix)
deallocate(p1matrix)
deallocate(p2matrix)
deallocate(uf)
deallocate(df)
deallocate(tf)
deallocate(sf)
deallocate(imatrix)
deallocate(dmatrix)
deallocate(ematrix)
deallocate(bmatrix)
deallocate(fmatrix)
deallocate(bayh)
deallocate(bayg)
deallocate(baym)
deallocate(bayp)
deallocate(bayb)

close(49, status='keep')
close(59, status='keep')
!close(19, status='keep')
call performance

write(*,44) ' Performance - CCI  ', icci(zz)*100, ' %'

end do
write(*,*) ' '
write(*,*) 'End of cross-validation process!'
write(*,*) ' '
else if (cross==2) then
call tencrossval
end if

!open(119, file='loga.txt', action='write', status='replace')
!open(109, file='logb.txt', action='write', status='replace')
!write(119,*) 'comatrix2'
!do i=1,z
!write(119,10) (comatrix(i,2,ff), ff=1,10)
!end do
!write(109,*) 'comatrix1'
!do i=1,z
!write(109,10) (comatrix(i,1,ff), ff=1,10)
!end do
!write(109,*) 'comatrix3'
!do i=1,z
!write(109,10) (comatrix(i,3,ff), ff=1,10)
!end do
!write(109,*) 'suitability'
!do i=1,z
!write(109,10) (suitability(i,ff), ff=1,10)
!end do
!write(109,*) 'icci'
!write(109,*) icci
cci=(sum(icci(1:10))/10)*100
!write(109,*) cci
!close(109, status='keep')
call sleep(2)
z=n
zz=1
call tester
end if
allocate(cs(ee))
allocate(habcon(ee))
allocate(gwet(ee))
allocate(wet(ee))

do i=1,ee
if (s(i,zz)>0) then
cs(i)=1
else
cs(i)=0
end if
end do

!Habitat connectivity (habcon and habc)
do i=1,ee
if (testmat(i,2)>0 .and. s(i,zz)>0.6) then
gwet(i)=1
else
gwet(i)=0
end if
end do

do i=1,ee
if (s(i-1,zz)>0.6 .and. s(i,zz)>0.6) then
habcon(i)=1
else
habcon(i)=0
end if
end do

!Wetted nodes
do i=1,ee
if (testmat(i,2)>0) then
wet(i)=1
else
wet(i)=0
end if
end do

pwet=sum(((wet)/ee)*100)
osi=real(sum(s))
nosi=osi/(sum(cs))
cert=anint((sum(cer)/ee)*100)
habc=anint((sum(habcon)/sum(gwet))*100)
haba=anint((sum(habcon)/ee)*100)

open (unit=39, file='bmatrix.txt', status='old', action='read')
close (39, status='delete')

open (unit=59, file='amatrix.txt', status='old', action='read')
close (59, status='delete')

write(*,*) ' '
write(*,*) 'Finished!'
write(*,*) ' '
write(*,44) ' Overall model performance      ', cci, ' %'
write(*,44) ' Percent wetted nodes           ', pwet, ' %'
write(*,*) 'Certainty of prediction  ', cert, '%'
write(*,*) 'Habitat connectivity     ', habc, '%'
write(*,*) 'Habitat availability     ', haba, '%'

write(*,100) ' Overall Suitability Index - OSI  ', osi
write(*,100) ' Normalized OSI                ', nosi

100 format (a,10f10.3)
44 format (a,f6.2,a)
write(*,*) ' '
print *, 'Writing results to files...'
print *, ' '
call sleep(2)
print *, 'Results ready'
print *, 'End of process'
print *, 'Please check the created file suitability.txt'
print *, ' '
write(*,*) 'Thank you for using HABFUZZ!'
print *, char(7)
write(*,*) 'Press ENTER to exit'
read(*,*)
10 format (10f7.3)
end program habfuzz
