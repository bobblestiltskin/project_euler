#! /usr/bin/gforth

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

: count_primes ( n -- primen )
( counts primes until the nth prime and returns it )
1 0 rot
begin
  rot dup isprime 
  if
    rot 1+ rot rot ( increment prime count )
  then
  1+ ( increment i )
  rot rot 2dup = ( check for prime count == limit )
until
drop drop 1 -
;

10001 count_primes . cr

bye
