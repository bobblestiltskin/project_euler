#! /usr/bin/gforth

28123 constant SIZE
variable abundanti SIZE cells allot
variable abundantbit SIZE allot
variable addi
0 addi c!
variable leaveloop
0 leaveloop c!

: sum_factors ( num -- sum )
  dup 1 swap 2
  begin
    dup dup * rot <=
  while
    rot swap 2dup /mod swap
    if
      drop rot swap
    else
      2dup =
      if
        drop swap rot rot + dup 
      else
        2swap swap rot + rot dup rot + swap
      then
    then
    1+ >r over r>
  repeat
  rot 2drop
;

: pe023
( clear the bit vector )
SIZE 0 do
  0 abundantbit i + c!
loop

( store the abundant numbers to the vector abundanti and set the elements corresponding )
( to the sum of the factors in the bit vector abundantbit )
0
SIZE 1 do
  i dup sum_factors 2dup
  <
  if
    drop 2dup swap
    abundanti swap cells + !
    dup rot swap
    dup SIZE <
    if 
      abundantbit + 1 swap c!
    then
    1+ swap dup
  then
    2drop
loop
( stack now contains number of abundant numbers )

( initialise the sum )
0
( add in all of the integers until we reach the first abundant number )
abundanti @ 1 do
  i +
loop

( loop from first abundant number until SIZE checking the bit vector and )
( the abundant vector to determine if a sum can be made. if not, add the )
( value to our running sum and display it )
swap
SIZE abundanti @ do
  1 addi c!
  begin
    dup
    0 do
      dup i = leaveloop c!
      abundanti i cells + @ 
      j 
      >=
      if
         1 leaveloop c!
        leave
      else
        j abundanti i cells + @ - 
        abundantbit + c@
        if
          0 addi c!
          1 leaveloop c!
          leave
        then
      then
    loop
    leaveloop c@
  until
   addi c@ 
   if
      swap i + swap
      0 addi c! 
   then
loop
drop . cr
;

pe023
bye
