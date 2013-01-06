#! /usr/bin/gforth

: pe009
1000 1 do
  1000 i do
    1000 j do
     i j k + + 1000 =
     if
       k k * j j * + i i * =
       if 
         i j k * * . cr
         bye
       then
     then
    loop
  loop
loop
;

pe009
bye
