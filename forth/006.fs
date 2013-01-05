#! /usr/bin/gforth

include even.fs

: sumsq  ( n -- sumsq )
( returns the sum of the square of all integers to n )
0 swap 1+ 0 do
  i dup * + 
loop
;

: sqsum ( n -- sqsum )
( returns the square of the sum of all integers to n )
  dup even 
  if
    dup 1+ swap 2 / *
  else 
    1+ dup 2 / dup 1 - rot * +
  then
  dup *
;

: pe006 ( -- )
100 dup sqsum swap sumsq - . cr
;

pe006
bye
