#! /usr/bin/gforth

include isprime.fs

: pe010
0.
2000000 0 do
  i isprime
  if
    i m+
  then
loop
d. cr
;

pe010
bye
