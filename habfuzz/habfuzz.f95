!HABFUZZ
!Copyright © 2016 Christos Theodoropoulos
    
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

!A welcome message
write(*,*) 'Welcome to HABFUZZ!'
write(*,*) 'Now you can calculate the hydraulic habitat suitability'
write(*,*) 'using fuzzy logic or the fuzzy Bayesian joint probability'
write(*,*) 'Press ENTER to start'
read(*,*)

!Reading the first user-defined parameter (method selection)
print *, 'Select the inference process to be applied'
print *, '1: Fuzzy'
print *, '2: Fuzzy Bayesian'
read *, proc

!Opening input files
open (unit=99, file='depths.txt', status='old', action='read')
open (unit=89, file='velocities.txt', status='old', action='read')
open (unit=79, file='substrates.txt', status='old', action='read')
read(99, *) n
read(89, *) n
read(79, *) n
allocate(u(n))
allocate(d(n))
allocate(sub(n))

do i=1,n
read(99,*) d(i)
end do

do i=1,n
read(89,*) u(i)
end do

do i=1,n
read(79,*) sub(i)
end do

!Calling subroutines
if (proc==1) then !If the user selected 'fuzzy'
!Apply the fuzzy inference process
print *, 'Select the preferred scenario to implement'
print *, '1: Average'
print *, '2: Worst'
print *, '3: Optimum'
print *, '4: Default'
read *, scenario

print *, 'Select the preferred defuzzification method'
print *, '1: Centroid'
print *, '2: Max membership'
print *, '3: Weighted average'
print *, '4: Mean-max membership'
print *, '5: Default'
read *, dfuzz

print *, 'Fuzzifying...'
call fuzzifier
print *, 'Fuzzification successful.'
print *, 'Membership degrees for each class available at the log file.'
print *, ' '

!Writing internal parameters in the log.txt file
open(29, file='log.txt', action='write', status='replace')
write (29,*) ' V-Very high membership class'
do i=1,n
write(29,10) (uvh(i))
end do

write (29,*) ' '
write (29,*) ' V-High membership class'
do i=1,n
write(29,10) (uh(i))
end do

write (29,*) ' '
write (29,*) ' V-Moderate membership class'
do i=1,n
write(29,10) (um(i))
end do

write (29,*) ' '
write (29,*) ' V-Low membership class'
do i=1,n
write(29,10) (ul(i))
end do

write (29,*) ' '
write (29,*) ' V-Very low membership class'
do i=1,n
write(29,10) (uvl(i))
end do

write (29,*) ' '
write (29,*) ' D-Very deep membership class'
do i=1,n
write(29,10) (dvd(i))
end do

write (29,*) ' '
write (29,*) ' D-Deep membership class'
do i=1,n
write(29,10) (dd(i))
end do

write (29,*) ' '
write (29,*) ' D-Moderate membership class'
do i=1,n
write(29,10) (dm(i))
end do

write (29,*) ' '
write (29,*) ' D-Shallow membership class'
do i=1,n
write(29,10) (ds(i))
end do

write (29,*) ' '
write (29,*) ' D-Very shallow membership class'
do i=1,n
write(29,10) (dvs(i))
end do

print *, 'Applying IF-THEN rules...'
if (scenario==1) then
call smod
else if (scenario==2) then
call swors
else if (scenario==3) then
call sopt
else
call smod
end if
print *, 'Rule application successful.'
print *, ' '

print *, 'Defuzzifying...'
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
print *, 'Defuzzification successful.'
print *, ' '

print *, 'Writing results to files...'
print *, ' '

!Writing results to files
open(19, file='suitability.txt', action='write', status='replace')
do i=1,n
write(19,10) (suitability(i)/5)
end do
10 format (6f7.3)

else !If the user selected 'fuzzy Bayesian'
!Apply the fuzzy Bayesian inference process through hfbayes
call hfbayes
end if

print *, 'Results ready.'
print *, 'End of process.'
print *, 'Please check the created file suitability.txt.'
print *, ' '
write(*,*) 'Press ENTER to exit HABFUZZ'
read(*,*)

end program habfuzz
