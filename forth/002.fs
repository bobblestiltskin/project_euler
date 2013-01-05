#! /usr/bin/gforth

include even.fs

: fib ( sum previous current -- sum current next )
( ." fib before " .S cr )
dup rot + ;
( ." fib after " .S cr ; )

: add-number ( sum previous current -- sum+current previous current )
( ." add-number before " .S cr )
rot swap dup rot + rot rot ;
( ." add-number after " .S cr ; )

: test-number ( sum previous current -- sum+even_current previous current )
dup even if add-number then ;

: test-loop ( sum first second  -- sum )
( ." test-loop before " .S cr )
begin fib test-number dup 4000000 > until 
( we may have added our terminating term if it is even - if so we have to subtract it before exit )
swap drop dup even if - else drop then ;
( ." test-loop after " .S cr ; )

: pe002 ( -- )
0 1 1 test-loop . cr ;

pe002
bye
