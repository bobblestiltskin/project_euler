#! /usr/bin/gforth

1000000 constant lastnum
variable maxi
variable maxv

: get_next_term ( d -- next_term )
( return num % 2 ? num + num + num + 1 : num >> 1; )
  2dup drop 2 mod
  if
    2dup 2dup d+ d+ swap 1+ swap
  else
    d2/
  then
;

: pe014
lastnum dup 2/ do
   0 0. i m+ 
   begin
     get_next_term
     2dup
     1.
     d= 
     0=
   while
     rot 1+ rot rot
   repeat
   2drop
   dup maxv @
   >
   if
     maxv !
     i maxi !
   else
     drop
   then
loop
maxi @ . cr
;

pe014
bye
