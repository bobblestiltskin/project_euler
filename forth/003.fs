#! /usr/bin/gforth

600851475143 constant penumber64
3851020999 139 2constant penumber32
( 600851475143 is 0x8BE589EAC7 - will overflow 32-bit)
( 0x8B is 139 and 0xE589EAC7 is 3851020999)
775146 constant sqroot
( root 600851475143 is 775146.099)

include isprime.fs

: is64bit
  1 cells 8 =
;

: pe003
1 sqroot do
is64bit
if
  penumber64 i /mod
else
  penumber32 i fm/mod
then
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

pe003
bye
