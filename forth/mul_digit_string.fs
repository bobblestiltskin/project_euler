#! /usr/bin/gforth

create carry 0 c,

: increment ( variable -- )
( increments the variable )
  dup @ 1 + swap !
;

: _mul_digit_string ( endptr len digit -- )
( multiply the string with last digit at result+numlen by digit and overwrite the string extending if necessary )
  0 carry c!
  over 0 do
    rot dup c@ 
    2swap
    rot swap dup rot
    * carry c@ +
    2swap swap 2swap rot 
    swap
    10 /mod 
    rot rot swap dup 1 2swap 
    c! - swap 
    carry c! rot rot
  loop

  carry c@ dup
  if
    rot 1 + rot rot 
    2swap rot rot dup rot swap c!
    rot rot swap
  else
    drop
  then
;

: mul_digit_string ( start len digit -- )
( multiply the string by digit and overwrite the string extending if necessary )
  dup 0=
  if
    drop 1+ erase 1 1 1
  else
    dup 1 = 0=
    if
      rot rot dup rot + swap rot 
      _mul_digit_string
    then
  then
;
