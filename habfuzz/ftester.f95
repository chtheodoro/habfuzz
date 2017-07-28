subroutine ftester
use fdeclarations

implicit none

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
ematrix=testmat
z=ee
call fuzzifier
write(*,*) 'Fuzzification successful!'
write(*,*) ' '
write(*,*) 'Applying fuzzy rules...'
write(*,*) ' '
call sleep(2)
allocate(bmatrix(e**(w-1),w-1,ee))
allocate(high(ee))
allocate(good(ee))
allocate(moderate(ee))
allocate(poor(ee))
allocate(bad(ee))
allocate(fmatrix(nn,w-1,ee))
allocate(mmatrix(nn,w,ee))

do i=1,ee !!!!!!!
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

z=ee
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

zz=1
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
call sleep(2)
write(*,*) ' '

do i=1,ee
if (testmat(i,2)>0) then
if (high(i)<=0 .and. good(i)<=0 .and. moderate(i)<=0 .and. poor(i)<=0 .and. bad(i)<=0) then
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
write(*,*) 'Habitat suitability calculation for test microhabitat', i, 'successful'
write(19,10) (s(i,zz))
end do
write(*,*) ' '
write(*,*) 'Habitat suitability calculation successful!'
10 format (8f7.3)

end subroutine ftester
