#! /usr/bin/gforth

1000 constant power
301 constant numlen
( we know that 2^1000 is 302 bytes long )
variable result numlen cells allot
variable strbase
variable strlen
variable carry

: cdump ( ptr count -- )
( dumps count bytes from ptr )
( 0 do )
(   dup i + c@ 1 u.r )
( loop )
( drop )
( cr )
;

: double ( strlen -- )
( returns the string doubled )
0 swap strbase @ swap
0 do
  dup c@ 
  dup + rot + 10 /mod
  rot rot swap dup rot swap c! 
  1 - swap dup 
  if
    i 1 + strlen @ =
    if
      strlen dup @ 1 + swap ! swap dup c@ dup + rot + swap 2dup c!
    else
      swap
    then
  else
    swap
  then
loop 
drop drop
;

: pe016 ( -- )
result numlen + strbase !
1 strlen !
0 carry !
result numlen 1 + erase
2 strbase @ c!
power 1 do
(  i . cr )
(  result numlen 1 + cdump )
  strlen @ double
loop
( result numlen 1 + cdump )
0
( numlen 1+ 0 do )
strlen @ 0 do
  result i + c@ +
loop
. cr
;

pe016
bye
