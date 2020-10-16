#! /usr/bin/gforth

create cycle 31 c, 28 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 28 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 28 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 29 c, 31 c, 30 c, 31 c, 30 c, 31 c, 31 c, 30 c, 31 c, 30 c, 31 c,

: pe019
0 2
25 0 do
  48 0 do
    dup 0=
    if
      swap 1+ swap
    then
    i cycle + c@
    swap + 7 mod
  loop
loop
drop
. cr
;

pe019
bye
