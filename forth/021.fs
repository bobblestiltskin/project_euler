#! /usr/bin/gforth

10000 constant SIZE
variable array SIZE cells allot

: sum_factors ( num -- sum )
  dup 1 swap 2
  begin
    dup dup * rot <=
  while
    rot swap 2dup /mod swap
    if
      drop rot swap
    else
      2swap swap rot + rot dup rot + swap
    then
    1+ >r over r>
  repeat
  rot 2drop
;

: pe021
SIZE 0 do
  i sum_factors array i cells + !
loop
0
SIZE 0 do
  array i cells + @ dup
  SIZE <
  if
    dup i = 0=
    if
      dup array swap cells + @ i =
      if
        swap i + swap
      then
    then
  then
  drop
loop
. cr
;

pe021
bye
