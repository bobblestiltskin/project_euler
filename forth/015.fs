#! /usr/bin/gforth

( compute 2n!/n!*n! )

19 constant N-1
20 constant N
40 constant N2
variable numerators N-1 cells allot
variable denominators N-1 cells allot

: nummul ( -- )
( multiplies 20 bytes from numerators - double precision )
1.
20 0 do
  numerators i + c@ 1 m*/
loop
;

: denommul ( -- )
( multiplies 20 bytes from denominators - single precision )
1
20 0 do
  denominators i + c@ *
loop
;

: cdump ( ptr count -- )
( dumps count bytes from ptr )
0 do
  dup i + c@ .
loop
drop
cr
;

: set_numerators ( num -- )
( store n+1-2n to numerators )
dup dup
0 do
  i + 1+
  numerators i + c!
  dup
loop
2drop
;

: set_denominators ( num -- )
( store 1-n to denominators )
dup dup
0 do
  i 1+
  denominators i + c!
loop
2drop
;

: factorise ( num  -- )
dup
0 do
( ." i is " .S cr )
  0 do
( ." j is " .S cr )
    denominators i + c@ 
( ." denom i is " .S cr )
    dup 
( ." after dup " .S cr )
    1 =
( ." after 1 = " .S cr )
    if
( ." after if " .S cr )
      drop
( ." after drop " .S cr )
    else
( ." after else " .S cr )
      numerators j + c@ 
( ." num j is " .S cr )
      swap 
( ." after swap " .S cr )
      2dup 
( ." after 2dup " .S cr )
      mod 0=
      if
( ." after if " .S cr )
        /
( ." after / " .S cr )
        numerators j + c!
( ." after num store " .S cr )
        1 denominators i + c!
( ." after denom store " .S cr )
      then
    then
  loop
loop
;

: pe015 ( -- )
  20 set_numerators
  20 set_denominators
  20 factorise
  nummul 1 denommul m*/
  d. cr
;

pe015
bye
