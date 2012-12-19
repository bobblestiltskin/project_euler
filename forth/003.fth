#! /usr/bin/gforth

3851020999 139 2constant penumber 
( 600851475143 is 0x8BE589EAC7 - will overflow 32-bit) 
( 0x8B is 139 and 0xE589EAC7 is 3851020999)
775146 constant sqroot
( root 600851475143 is 775146.099)

: isprime ( n -- isprime )
dup 2 mod ( check for even)
if 
  dup 8 < ( check for < 8 - all odd are prime apart from 1)
  if 
    dup 1 = 1+ ( check for == 1)
  else
    3 ( start with divisor of 3) 
    begin
      2dup mod ( check for n mod k)
      if
        2dup dup * > ( check for k*k > n)
        if 
          2 + 0  ( bump k and restart loop)
        else 
          1 1 ( set isprime and terminate loop)
        then
      else
        0 1 ( clear isprime and terminate loop)
      then
    until
    swap drop 
  then
else 
  dup 2 = 0= 1+ ( check for == 2 )
then
swap drop ( drop all but isprime)
;

: myloop
1 sqroot do
penumber i fm/mod
drop 0=
if 
  i isprime
  if
    i . cr
    leave
  then
then
-1 +loop
;

myloop
bye
