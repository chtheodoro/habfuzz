subroutine fuzzy
use fdeclarations

implicit none

print *, ' '
print *, 'Select the preferred scenario to implement'
print *, '1: Average'
print *, '2: Worst'
print *, '3: Optimum'
print *, '4: Default'
read *, scenario

print *, ' '
print *, 'Select the preferred defuzzification method'
print *, '1: Centroid'
print *, '2: Max membership'
print *, '3: Weighted average'
print *, '4: Mean-max membership'
print *, '5: Default'
read *, dfuzz
write(*,*) ' '

write(*,*) 'Initializing fuzzy logic...'
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

call fruler
!write(49,*) ' '
!write(49,*) 'pmatrix'
!do i=1,nn
!write(49,10) (pmatrix(i,j), j=1,w+2)
!end do
write(49,*) ' '
write(49,*) ' Fuzzy memberships matrix depending on the selected scenario'
write(49,*) ' Average, Worst, Optimum'
do i=1,nn
write(49,10) (p22matrix(i,j), j=1,w-2)
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
write(*,*) 'Applying fuzzy rules...'
write(*,*) ' '

call sleep(2)
allocate(bmatrix(e**(w-1),w-1,z))
allocate(high(z))
allocate(good(z))
allocate(moderate(z))
allocate(poor(z))
allocate(bad(z))
allocate(fmatrix(nn,w-1,z))
allocate(mmatrix(nn,w,z))

do i=1,z !!!!!!!
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

write(49,*) 'fmatrix'
do jj=1,nn
write(49,10) (fmatrix(jj,j,i), j=1,w-1)
end do

call rules1

write(49,*) ' Fuzzy memberships matrix for each class'
write(49,*) ' H      G      M      P      B'
do jj=1,nn
write(49,10) (mmatrix(jj,j,i), j=1,w)
end do
write(*,*) 'Rules application for microhabitat', i, 'successful'
end do !!!!!!!!!!!!
write(*,*) ' '
write(*,*) 'Rules application successful!'

write (49,*) ' '
write (49,*) ' High habitat suitability membership'
do i=1,z
write(49,10) (high(i))
end do

write (49,*) ' '
write (49,*) ' Good habitat suitability membership'
do i=1,z
write(49,10) (good(i))
end do

write (49,*) ' '
write (49,*) ' Moderate habitat suitability membership'
do i=1,z
write(49,10) (moderate(i))
end do

write (49,*) ' '
write (49,*) ' Poor habitat suitability membership'
do i=1,z
write(49,10) (poor(i))
end do

write (49,*) ' '
write (49,*) ' Bad habitat suitability membership'
do i=1,z
write(49,10) (bad(i))
end do

write(*,*)
print *, 'Defuzzifying...'
call sleep(2)
if (dfuzz==1) then
call centroid
else if (dfuzz==2) then
call maxmem
else if (dfuzz==3) then
call waver
else if (dfuzz==4) then
call meanmax
else
call centroid
end if
print *, 'Defuzzification successful!'
print *, ' '

print *, 'Calculating suitability...'
write(*,*) ' '
call sleep(2)

!open(19, file='suitability.txt', action='write', status='replace')
do i=1,z
write(*,*) 'Habitat suitability calculation for microhabitat', i, 'successful'
!write(19,10) (suitability(i,ff), ff=1,10)
end do
write(*,*) ' '
write(*,*) 'Habitat suitability calculation successful!'

deallocate(a)
deallocate(bins)
deallocate(iimatrix)
deallocate(amatrix)
deallocate(pmatrix)
deallocate(p22matrix)
deallocate(uf)
deallocate(df)
deallocate(tf)
deallocate(sf)
deallocate(imatrix)
deallocate(dmatrix)
deallocate(ematrix)
deallocate(bmatrix)
deallocate(fmatrix)
deallocate(mmatrix)
deallocate(p11matrix)
deallocate(high)
deallocate(good)
deallocate(moderate)
deallocate(poor)
deallocate(bad)

close(49, status='keep')
close(59, status='keep')
!close(19, status='keep')

call performance
write(*,*) 'Performance - CCI', int(icci(zz)*100), '%'

end do
write(*,*) ' '
write(*,*) 'End of cross-validation process!'
write(*,*) ' '

!write(*,*) 'comatrix2'
!do i=1,z
!write(*,10) (comatrix(i,2,ff), ff=1,10)
!end do
!write(*,*) 'comatrix1'
!do i=1,z
!write(*,10) (comatrix(i,1,ff), ff=1,10)
!end do
!write(*,*) 'comatrix3'
!do i=1,z
!write(*,10) (comatrix(i,3,ff), ff=1,10)
!end do
!write(*,*) 'suitability'
!do i=1,z
!write(*,10) (suitability(i,ff), ff=1,10)
!end do
!write(*,*) 'icci'
!write(*,*) icci
cci=anint((sum(icci(1:10))/10)*100)
!write(*,*) cci

call sleep(2)
z=n
zz=1
call tester

10 format (8f7.3)

end subroutine fuzzy
