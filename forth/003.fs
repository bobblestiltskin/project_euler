#! /usr/bin/gforth

3851020999 139 2constant penumber 
( 600851475143 is 0x8BE589EAC7 - will overflow 32-bit) 
( 0x8B is 139 and 0xE589EAC7 is 3851020999)
775146 constant sqroot
( root 600851475143 is 775146.099)

include isprime.fs

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
