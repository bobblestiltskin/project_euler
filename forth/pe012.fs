#! /usr/bin/gforth

500 constant numfactors

: get_num_divisors ( n -- divisors )
0 swap 1 ( start with divisor of 1 ) 
begin
    2dup mod 0= ( check for n mod k )
    if
      rot 1+ rot rot
    then
  2dup dup * > ( check for k*k > n)
while
  1+
repeat
2drop 2*
;

: pe012
0 1 
begin 
  dup rot + dup
  get_num_divisors
  numfactors <
while
  swap 1+
repeat      
swap drop . cr
;

pe012
bye
