#! /usr/bin/gforth
: mod5 ( n -- ismod )
5 mod 0= ;

: mod3 ( n -- ismod )
3 mod 0= ;

: add-number ( sum n -- sum n )
dup rot + swap ;

: test-number ( n -- )
dup mod5 if add-number else 
dup mod3 if add-number then then drop ;

: test-loop ( n  -- )
0 do i test-number loop ;

: pe001 ( -- )
0 1000 test-loop . cr ;

pe001
bye
