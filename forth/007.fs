#! /usr/bin/gforth

include isprime.fs

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

: pe007
10001 count_primes . cr
;

pe007
bye
