#! /usr/bin/gforth

: letter_count (  count ptr len -- numletters )
0 do
  dup
  i + c@ 32 = 0=
  if 
    swap 1+ swap
  then
loop
drop
;

: "units"  c"   one  twothree four five  sixseveneight nine" ;
: unitsl   5 *  "units" 1+ +  5 letter_count ;

: "tens" c"       ten   eleven   twelve thirteen fourteen  fifteen  sixteenseventeen eighteen nineteen" ;
: tensl   9 *  "tens" 1+ +  9 letter_count ;

: "twenties" c"      twenty  twentyone  twentytwotwentythree twentyfour twentyfive  twentysixtwentyseventwentyeight twentynine" ;
: twentiesl   11 *  "twenties" 1+ +  11 letter_count ;

: "thirties" c"      thirty  thirtyone  thirtytwothirtythree thirtyfour thirtyfive  thirtysixthirtyseventhirtyeight thirtynine" ;
: thirtiesl   11 *  "thirties" 1+ +  11 letter_count ;

: "forties" c"      forty  fortyone  fortytwofortythree fortyfour fortyfive  fortysixfortysevenfortyeight fortynine" ; 
: fortiesl   10 *  "forties" 1+ +  10 letter_count ;

: "fifties" c"      fifty  fiftyone  fiftytwofiftythree fiftyfour fiftyfive  fiftysixfiftysevenfiftyeight fiftynine" ;
: fiftiesl   10 *  "fifties" 1+ +  10 letter_count ;

: "sixties" c"      sixty  sixtyone  sixtytwosixtythree sixtyfour sixtyfive  sixtysixsixtysevensixtyeight sixtynine" ;
: sixtiesl   10 *  "sixties" 1+ +  10 letter_count ;

: "seventies" c"      seventy  seventyone  seventytwoseventythree seventyfour seventyfive  seventysixseventysevenseventyeight seventynine" ;
: seventiesl   12 *  "seventies" 1+ +  12 letter_count ;

: "eighties" c"      eighty  eightyone  eightytwoeightythree eightyfour eightyfive  eightysixeightyseveneightyeight eightynine" ;
: eightiesl   11 *  "eighties" 1+ +  11 letter_count ;

: "nineties" c"      ninety  ninetyone  ninetytwoninetythree ninetyfour ninetyfive  ninetysixninetysevenninetyeight ninetynine" ;
: ninetiesl   11 *  "nineties" 1+ +  11 letter_count ;

: hundredl 7 ;
: hundredandl 10 ;
: onethousandl 11 ;

: firsthundred ( sum -- sum )
9 0 do
  0 i unitsl +
loop 
10 0 do
  0 i tensl +
loop 
10 0 do
  0 i twentiesl +
loop 
10 0 do
  0 i thirtiesl +
loop 
10 0 do
  0 i fortiesl +
loop 
10 0 do
  0 i fiftiesl +
loop 
10 0 do
  0 i sixtiesl +
loop 
10 0 do
  0 i seventiesl +
loop 
10 0 do
  0 i eightiesl +
loop 
10 0 do
  0 i ninetiesl +
loop 
;

: hundred ( sum -- sum )
dup rot rot
9 0 do
  0 swap unitsl + 
  hundredandl + 
  0 i unitsl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i tensl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i twentiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i thirtiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i fortiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i fiftiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i sixtiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i seventiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i eightiesl +
  swap dup rot rot
loop 
10 0 do
  0 swap unitsl + hundredandl + 0 i ninetiesl +
  swap dup rot rot
loop 
drop swap drop
;

: pe017 ( -- )
0
firsthundred
9 0 do
  0 i unitsl + hundredl +
  i hundred
loop
onethousandl +
. cr
;

pe017
bye
