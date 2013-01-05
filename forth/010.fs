#! /usr/bin/gforth

include isprime.fs

: newloop
0.
2000000 0 do
  i isprime
  if
    i m+
  then
loop
d. cr
;

newloop
bye
