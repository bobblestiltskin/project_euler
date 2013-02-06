#! /usr/bin/gforth

create row1 75 ,
create row2 95 , 64 ,
create row3 17 , 47 , 82 ,
create row4 18 , 35 , 87 , 10 ,
create row5 20 , 04 , 82 , 47 , 65 ,
create row6 19 , 01 , 23 , 75 , 03 , 34 ,
create row7 88 , 02 , 77 , 73 , 07 , 63 , 67 ,
create row8 99 , 65 , 04 , 28 , 06 , 16 , 70 , 92 ,
create row9 41 , 41 , 26 , 56 , 83 , 40 , 80 , 70 , 33 ,
create row10 41 , 48 , 72 , 33 , 47 , 32 , 37 , 16 , 94 , 29 ,
create row11 53 , 71 , 44 , 65 , 25 , 43 , 91 , 52 , 97 , 51 , 14 ,
create row12 70 , 11 , 33 , 28 , 77 , 73 , 17 , 78 , 39 , 68 , 17 , 57 ,
create row13 91 , 71 , 52 , 38 , 17 , 14 , 91 , 43 , 58 , 50 , 27 , 29 , 48 ,
create row14 63 , 66 , 04 , 68 , 89 , 53 , 67 , 30 , 73 , 16 , 69 , 87 , 40 , 31 ,
create row15 04 , 62 , 98 , 27 , 23 , 09 , 70 , 98 , 73 , 93 , 38 , 53 , 60 , 04 , 23 ,
create arows row1 , row2 , row3 , row4 , row5 , row6 , row7 , row8 , row9 , row10 , row11 , row12 , row13 , row14 , row15 , 

: get_cell ( i j -- cellij )
cells swap cells arows + @ + @
;

: print_cell ( i j -- cellij )
get_cell .
;

: store_cell ( value i j -- )
cells swap cells arows + @ + !
;

: print_row
dup dup 
1 + 0
do
  dup i print_cell
loop
cr
;

: pe018
2 15 do
i dup dup 
( i 1 - print_row 2drop )
1 - 0
do
  j 1 - i get_cell
  j 1 - i 1 + get_cell
  max
  j 2 - i get_cell +
  j 2 - i store_cell
loop
2drop
-1 +loop
0 0 print_cell cr
;

pe018
bye
