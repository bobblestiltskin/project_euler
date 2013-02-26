#! /usr/bin/gforth

( multiply a numeric string by a number  - requires input, output and numlen to be set )

include mul_digit_string.fs
include add_digit_strings.fs

create tmp numlen allot

: copy_output_to_input ( count -- )
( copies input to tmp shifted by offset characters )
0 swap
do
  output i + 1 - c@ 
  input i + 1 - c!
  -1
+loop
;

: copy_input_to_tmp ( offset count -- )
( copies input to tmp shifted by offset characters )
0 swap
do
  input i + 1 - c@ 
  tmp i + 1 - rot - c!
  dup -1
+loop
;

: mul_int_string ( number -- )
( multiplies input array by passed number and stores to output )
  0 swap
  begin
    10 /mod 
    swap rot
    tmp numlen erase
    dup
    numlen copy_input_to_tmp
    1+
    swap drop rot rot
    tmp numlen 1 - 
    rot
    mul_digit_string
    tmp numlen output numlen add_strings
    2drop drop dup
   while
   repeat
;
