#! /usr/bin/gforth

variable index
variable forward 5 cells allot
999 constant MAX3
100 constant MIN3
variable maxv
variable min3i
variable min3j

: num_digits ( num -- numdigits)
( handles all 32-bit numbers )
dup 999999999 > if 10 else 
dup  99999999 > if 9 else 
dup   9999999 > if 8 else 
dup    999999 > if 7 else 
dup     99999 > if 6 else 
dup      9999 > if 5 else 
dup       999 > if 4 else 
dup        99 > if 3 else 
dup         9 > if 2 else 
1 then then then then then then then then then nip ;

: stringify ( num -- )
( store the number - maximum 999999 - to the array forward )
  dup num_digits 1 - index !
  forward 6 cells erase
  begin
    10 /mod dup 
  while
    swap forward index @ + c! -1 index +!
  repeat
  drop
  forward index @ + c!
;

: is_palindromic ( num -- is_palindromic )
( returns 1 if the number passed is palindromic )
  dup num_digits swap stringify
  dup 2 / 0 
  do
    forward i + c@
    swap
    dup i - 1 - forward + c@
    rot
    -
    if 
      drop 0 leave 
    then
  loop
  dup
  if 
    drop 1
  then
;

: pe004 ( -- max_palindrome )

MIN3 min3j !
MIN3 min3i !

MAX3 MAX3 begin
  begin
    2dup * dup is_palindromic
    if ( set maxv and drop termination points to maxv/1000 )
      dup maxv @ > 
      if
        dup maxv !
        1000 / dup min3j ! min3i !
      else
        drop
      then
    else
      drop
    then
  dup min3j @ > 
  while
    1 -
  repeat
  drop dup min3i @ >
while
  1 -
  dup
repeat
maxv @
. cr
;

pe004
bye
