#! /usr/bin/gforth

include cdump.fs
include mul_digit_string.fs

5 constant numlen
10 constant maxnum

variable output numlen allot

: test_mul_digit_string ( -- )
  output numlen 1 + erase
  1 output numlen + c!
." before loop output is "
  output numlen 1 + cdump 
  maxnum 1 do
    i . cr
    output numlen i mul_digit_string
    drop drop drop
    output numlen 1 + cdump 
  loop

  0 . cr
  output numlen 0 mul_digit_string
  drop
  output numlen 1 + cdump 

  0
  numlen 0 do 
    output i + c@ + 
  loop 
  . cr
; 
 
test_mul_digit_string 
bye 
