subroutine tencrossval
use fdeclarations

implicit none

write(*,*) ' '
write(*,*) 'Initializing fuzzy Bayesian inference...'
call sleep(2)
call randomizer
do zz=1,10
write(*,*) ' '
write(*,*) 'ITERATION', zz
write(*,*) '----------------------'
call sleep(2)
call iterator10

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
deallocate(dmatrix)
deallocate(ematrix)
deallocate(amatrix)
deallocate(p1matrix)
deallocate(p2matrix)
deallocate(uf)
deallocate(df)
deallocate(tf)
deallocate(sf)
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
44 format (a,f6.2,a)
10 format (10f7.3)
end subroutine tencrossval
