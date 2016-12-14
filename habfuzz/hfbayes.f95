subroutine hfbayes
use fdeclarations

implicit none

print *, 'Fuzzifying inputs...'
call fuzzifier
print *, 'Fuzzification succesful.'
print *, 'Membership degrees for each class available at the log file.'
print *, ' '

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

print *, 'Applying Bayesian joint probability rules...'
call rules
print *, 'Probability application successful.'
print *, 'Suitability class probabilities available at the log file.'
print *, ' '

write (29,*) ' '
write (29,*) ' Joint probability of High suitability class'
do i=1,n
write(29,10) (bayh2(i))
end do

write (29,*) ' '
write (29,*) ' Joint probability of Good suitability class'
do i=1,n
write(29,10) (bayg2(i))
end do

write (29,*) ' '
write (29,*) ' Joint probability of Moderate suitability class'
do i=1,n
write(29,10) (baym2(i))
end do

write (29,*) ' '
write (29,*) ' Joint probability of Poor suitability class'
do i=1,n
write(29,10) (bayp2(i))
end do

write (29,*) ' '
write (29,*) ' Joint probability of Bad suitability class'
do i=1,n
write(29,10) (bayb2(i))
end do

print *, 'Calculating suitability'
print *, ' '

do i=1,n
hs(i)=bhigh(i)+bgood(i)+bmoderate(i)+bpoor(i)+bbad(i)
if (bayg1(i)<=0 .and. bayh1(i)<=0 .and. baym1(i)<=0 .and. bayp1(i)<=0 .and. bayb1(i)<=0) then
suitability(i)=-1
else
suitability(i)=hs(i)
end if
end do

print *, 'Writing results to files...'
print *, ' '

open(19, file='suitability.txt', action='write', status='replace')
do i=1,n
write(19,10) (suitability(i))
end do

10 format (6f7.3)

end subroutine hfbayes
