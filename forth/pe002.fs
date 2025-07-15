#! /usr/bin/gforth

: even ( n -- is_even )
2 mod 0=
;

: fib ( sum previous current -- sum current next )
dup rot + ;

: add-number ( sum previous current -- sum+current previous current )
rot swap dup rot + rot rot ;

: test-number ( sum previous current -- sum+even_current previous current )
dup even if add-number then ;

: test-loop ( sum first second  -- sum )
begin fib test-number dup 4000000 > until 
( we may have added our terminating term if it is even - if so we have to subtract it before exit )
swap drop dup even if - else drop then ;

: pe002 ( -- )
0 1 1 test-loop . cr ;

pe002
bye
