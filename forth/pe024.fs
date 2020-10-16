#! /usr/bin/gforth

( more reading shows my intuition was ok )
( - see http://en.wikipedia.org/wiki/Factorial_number_system )
( - and http://en.wikipedia.org/wiki/Permutation )

include cdump.fs
include add_digit_strings.fs

create str1 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 1 c, 
10 constant len1
create str2 2 c, 7 c, 8 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
10 constant len2

variable flag

: contains ( num ptr len -- flag )
( this takes as input num - a number to find in the len bytes from ptr - returns 1 if found, 0 if not )
0 flag c!
0 do
  dup i + c@ 
  rot dup rot =
  if
   1 flag c!
   leave
  else
    swap
  then
loop
2drop
flag c@
;

: test_add_strings ( -- )
2080 ( we have 2080 more permutations after 2780000000 )
begin
  str1 len1 str2 len2 add_strings
  0 str2 10 contains if
  1 str2 10 contains if
  2 str2 10 contains if
  3 str2 10 contains if
  4 str2 10 contains if
  5 str2 10 contains if
  6 str2 10 contains if
  7 str2 10 contains if
  8 str2 10 contains if
  9 str2 10 contains if
    1 -
  then then then then then
  then then then then then
  dup
  0 =
until
str2 10 cdump
;

test_add_strings
bye
