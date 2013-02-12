#! /usr/bin/gforth

( multiply a numeric string by a number )

6 constant numlen
create output numlen allot
( create input 0 c, 0 c, 0 c, 4 c, 5 c, 6 c, )
create input 0 c, 0 c, 0 c, 0 c, 0 c, 1 c,

include cdump.fs
include mul_int_string.fs

: test1
  output numlen erase
." input "
  input numlen cdump
." multiplied by 1 gives " cr
  1 mul_int_string
." output "
  output numlen cdump
;

: test2
  output numlen erase
." input "
  input numlen cdump
." multiplied by 2 gives " cr
  2 mul_int_string
." output "
  output numlen cdump
;

: test10
  output numlen erase
." input "
  input numlen cdump
." multiplied by 10 gives " cr
  10 mul_int_string
." output "
  output numlen cdump
;

: test20
  output numlen erase
." input "
  input numlen cdump
." multiplied by 20 gives " cr
  20 mul_int_string
." output "
  output numlen cdump
;

: test100
  output numlen erase
." input "
  input numlen cdump
." multiplied by 100 gives " cr
  100 mul_int_string
." output "
  output numlen cdump
;

: test123
  output numlen erase
." input "
  input numlen cdump
." multiplied by 123 gives " cr
  123 mul_int_string
." output "
  output numlen cdump
;


: test_mul_int_string ( -- )
  test1 
  test2
  test10
  test20
  test100
  test123
;

test_mul_int_string
bye
