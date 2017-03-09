subroutine permutator
use fdeclarations

10 format (6f7.3)
do col1 = 1,e
do col2 = 1,e
do col3 = 1,e
do col4 = 1,e
write(29,10) uf(i,col1), df(i,col2), sf(i,col3), tf(i,col4)
end do
end do
end do
end do
end subroutine permutator
