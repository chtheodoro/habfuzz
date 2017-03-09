subroutine combinations
use fdeclarations

10 format (6f7.3)
open(69, file='amatrix.txt', action='write', status='replace')
write(69,*) e**(w-1)
do col1 = 1,e
do col2 = 1,e
do col3 = 1,e
do col4 = 1,e
write(69,10) rmatrix(col1,1), rmatrix(col2,2), rmatrix(col3,3), rmatrix(col4,4)
end do
end do
end do
end do
close(69, status='keep')

end subroutine combinations
