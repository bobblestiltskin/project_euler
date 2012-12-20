#! /usr/bin/gforth

variable index
variable forward 5 cells allot
999 constant MAX3
100 constant MIN3
variable maxv
variable min3i
variable min3j

: num_digits_2 ( num -- numdigits)
9 > if 2 else 1 then ;

: num_digits_3 ( num -- numdigits)
dup 99 > if drop 3 else num_digits_2 then ;

: num_digits_4 ( num -- numdigits)
dup 999 > if drop 4 else num_digits_3 then ;

: num_digits_5 ( num -- numdigits)
dup 9999 > if drop 5 else num_digits_4 then ;

: num_digits_6 ( num -- numdigits)
dup 99999 > if drop 6 else num_digits_5 then ;

: stringify ( num -- )
( store the number - maximum 999999 - to the array forward )
dup num_digits_6 1 - index !
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
  dup num_digits_6 swap stringify
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

: testloop ( -- max_palindrome )

MIN3 min3j !
MIN3 min3i !

MAX3 begin
  MAX3 begin
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
repeat
maxv @
;

testloop . cr

bye
