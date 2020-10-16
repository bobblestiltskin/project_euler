#! /usr/bin/gforth

64 constant ASCII

5163 constant NAMES
( from perl -ne '$count = $_ =~ tr/,/,/; print $count,"\n"' ../names.txt )

46448 constant SIZE
( from wc -c ../names.txt )

variable namestart NAMES cells allot
variable namesize NAMES allot
variable sorted NAMES cells allot

variable nameptr
0 nameptr !

variable comma 
44 comma c!

variable swapped
1 swapped c!

: get_value ( pos addr len -- value )
  0 swap
  0 do
    swap
    dup i + c@ ASCII - 
    rot +
  loop
  swap drop *
;

( : dump_names )
(   NAMES 0 do )
(     ." i is " i . ." and namestart is " namestart i cells + @ . ." and namesize is " namesize i + c@ .  )
(     ." sorted " sorted i cells + @ . namestart i cells + @ namesize i + c@ type cr )
(   loop )
( ; )

( : dump_sorted )
(   NAMES 0 do )
(     ." i is " i . ." and namestart is " namestart sorted i cells + @ cells + @ . ." and namesize is " namesize sorted i cells + @ + c@ .  )
(     namestart sorted i cells + @ cells + @ namesize sorted i cells + @ + c@ type cr )
(   loop )
( ; )

: initialise_sorted 
  NAMES 0 do
    i sorted i cells + !
  loop
;

: sum_sorted
  0
  NAMES 0 do
    i 1 +
    namestart
    sorted i cells + @ dup rot swap
    cells + @ swap
    namesize
    + c@
    get_value +
  loop
  . cr
;

: strip_quotes_store
    2 - swap 1 + swap
    namesize nameptr @ dup rot + rot swap c! 
    dup namestart swap cells + rot swap !
    1 + nameptr !
;

: pe022
initialise_sorted 
s" ../names.txt"
r/o open-file 0=
if 
  slurp-fid
  2dup
( loop over the input string splitting on , and storing start to namestart and size to namesize )
  begin
    comma 1 
    search 
  while
    2dup 2rot 2swap
    swap drop -
    strip_quotes_store
    swap 1 + swap 1 -
    2dup
  repeat
  2drop
  strip_quotes_store
then
( dump_names )

( bubble sort - fast enough here - could re-implement to use qsort if wanted )

begin
  0 swapped c!
  NAMES 1 - 0 do
    namestart sorted i cells + @ dup rot swap
    cells + @ swap namesize + c@
    namestart sorted i 1 + cells + @ dup rot swap
    cells + @ swap namesize + c@
    compare
    1 =
    if
      sorted i cells + dup 1 cells + 2dup @ swap @
      rot ! swap !
      1 swapped c!
    then
  loop
  swapped c@ 0 =
until
sum_sorted
;

pe022
bye
