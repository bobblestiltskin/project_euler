#! /usr/bin/gforth
: even ( n -- iseven )
2 mod 0= ;

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

: answer ( -- )
100 dup sqsum swap sumsq -
;

answer . cr

( 4 dup . sqsum . cr )
( 5 dup . sqsum . cr )
( 7 dup . sqsum . cr )
( 100 dup . sqsum . cr )
( 4 dup . sumsq . cr )
( 5 dup . sumsq . cr )
( 7 dup . sumsq . cr )
( 100 dup . sumsq . cr )

bye
