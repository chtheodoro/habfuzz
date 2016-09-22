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

program habfuzz !Inputs the stream flow velocity, depth and substrate type and returns the instream habitat suitability based on fuzzy logic
use fdeclarations

implicit none

!READING IN THE 3 ARRAYS PLUS THE USER-DEFINED SCENARIO
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

!CALLING SUBROUTINES
print *, 'Fuzzifying...'
call fuzzifier
print *, 'Fuzzification successful.'
print *, ' '

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

!WRITING RESULTS
open(19, file='suitability.txt', action='write', status='replace')
do i=1,n
write(19,10) (suitability(i)/5)
end do
10 format (6f7.3)

print *, 'Results ready.'
print *, 'End of process.'
print *, 'Please check created file suitability.txt.'
print *, ' '
write(*,*) 'Press ENTER to exit habfuzz'
read(*,*)

end program habfuzz
