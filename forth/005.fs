#! /usr/bin/gforth

variable try_product

include isprime.fs

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
