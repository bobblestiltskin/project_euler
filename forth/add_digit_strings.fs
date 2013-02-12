#! /usr/bin/gforth

( add 2 strings )

: get_last_ptr ( start_ptr len -- last_ptr len )
  dup rot + 1 - swap 
;

: add_strings_short_to_long ( sptr1 slen1 lptr2 llen2 -- )
  drop rot rot 0 swap
  0 do
    rot rot 2dup 
    c@ swap c@ + 
    2swap rot rot + 10 /mod
    rot rot swap dup rot rot c!
    1 - rot 1 - rot
  loop
  if
    drop dup c@ 1+ swap c!
  else
    2drop
  then
;

: add_strings ( ptr1 len1 ptr2 len2 -- )
( add strings - result stored to longer string or second string if equal size )
  2over 2over
  rot 2swap 2drop
  <
  if
    2swap
  then
  get_last_ptr 2swap get_last_ptr 2swap
  add_strings_short_to_long
;
