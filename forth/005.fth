#! /usr/bin/gforth

variable try_product

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

: lcm ( n -- lcm )
( returns the lcm for all numbers up to n )
1 try_product !
1+ 1 swap dup 2
do
  i dup isprime 
  if 
    try_product @
    if
      swap dup i dup * dup rot swap
      <
      if
        0 try_product !
        drop rot rot * swap
      else
        begin
          2dup  
          >
          while 
            rot drop dup rot rot i *
        repeat
        drop swap rot * swap
      then
    else
      rot * swap
    then
  else
    drop
  then
loop
drop
;

20 lcm . cr

bye
