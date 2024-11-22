#! /usr/bin/gforth

26 constant columns
3 constant start
23 constant stop

create data
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 8 c, 2 c, 22 c,
97 c, 38 c, 15 c, 0 c, 40 c, 0 c, 75 c, 4 c, 5 c, 7 c, 78 c, 52 c,
12 c, 50 c, 77 c, 91 c, 8 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 49 c, 49 c,
99 c, 40 c, 17 c, 81 c, 18 c, 57 c, 60 c, 87 c, 17 c, 40 c, 98 c, 43 c,
69 c, 48 c, 4 c, 56 c, 62 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 81 c,
49 c, 31 c, 73 c, 55 c, 79 c, 14 c, 29 c, 93 c, 71 c, 40 c, 67 c, 53 c,
88 c, 30 c, 3 c, 49 c, 13 c, 36 c, 65 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
52 c, 70 c, 95 c, 23 c, 4 c, 60 c, 11 c, 42 c, 69 c, 24 c, 68 c, 56 c,
1 c, 32 c, 56 c, 71 c, 37 c, 2 c, 36 c, 91 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 22 c, 31 c, 16 c, 71 c, 51 c, 67 c, 63 c, 89 c, 41 c, 92 c, 36 c,
54 c, 22 c, 40 c, 40 c, 28 c, 66 c, 33 c, 13 c, 80 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 24 c, 47 c, 32 c, 60 c, 99 c, 3 c, 45 c, 2 c, 44 c,
75 c, 33 c, 53 c, 78 c, 36 c, 84 c, 20 c, 35 c, 17 c, 12 c, 50 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 32 c, 98 c, 81 c, 28 c, 64 c, 23 c, 67 c,
10 c, 26 c, 38 c, 40 c, 67 c, 59 c, 54 c, 70 c, 66 c, 18 c, 38 c, 64 c,
70 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 67 c, 26 c, 20 c, 68 c, 2 c, 62 c,
12 c, 20 c, 95 c, 63 c, 94 c, 39 c, 63 c, 8 c, 40 c, 91 c, 66 c, 49 c,
94 c, 21 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 24 c, 55 c, 58 c, 5 c, 66 c,
73 c, 99 c, 26 c, 97 c, 17 c, 78 c, 78 c, 96 c, 83 c, 14 c, 88 c, 34 c,
89 c, 63 c, 72 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 21 c, 36 c, 23 c, 9 c,
75 c, 0 c, 76 c, 44 c, 20 c, 45 c, 35 c, 14 c, 0 c, 61 c, 33 c, 97 c,
34 c, 31 c, 33 c, 95 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 78 c, 17 c, 53 c,
28 c, 22 c, 75 c, 31 c, 67 c, 15 c, 94 c, 3 c, 80 c, 4 c, 62 c, 16 c,
14 c, 9 c, 53 c, 56 c, 92 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 16 c, 39 c,
5 c, 42 c, 96 c, 35 c, 31 c, 47 c, 55 c, 58 c, 88 c, 24 c, 0 c, 17 c,
54 c, 24 c, 36 c, 29 c, 85 c, 57 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 86 c,
56 c, 0 c, 48 c, 35 c, 71 c, 89 c, 7 c, 5 c, 44 c, 44 c, 37 c, 44 c,
60 c, 21 c, 58 c, 51 c, 54 c, 17 c, 58 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
19 c, 80 c, 81 c, 68 c, 5 c, 94 c, 47 c, 69 c, 28 c, 73 c, 92 c, 13 c,
86 c, 52 c, 17 c, 77 c, 4 c, 89 c, 55 c, 40 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 4 c, 52 c, 8 c, 83 c, 97 c, 35 c, 99 c, 16 c, 7 c, 97 c, 57 c,
32 c, 16 c, 26 c, 26 c, 79 c, 33 c, 27 c, 98 c, 66 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 88 c, 36 c, 68 c, 87 c, 57 c, 62 c, 20 c, 72 c, 3 c,
46 c, 33 c, 67 c, 46 c, 55 c, 12 c, 32 c, 63 c, 93 c, 53 c, 69 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 4 c, 42 c, 16 c, 73 c, 38 c, 25 c, 39 c, 11 c,
24 c, 94 c, 72 c, 18 c, 8 c, 46 c, 29 c, 32 c, 40 c, 62 c, 76 c, 36 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 20 c, 69 c, 36 c, 41 c, 72 c, 30 c, 23 c,
88 c, 34 c, 62 c, 99 c, 69 c, 82 c, 67 c, 59 c, 85 c, 74 c, 4 c, 36 c,
16 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 20 c, 73 c, 35 c, 29 c, 78 c, 31 c,
90 c, 1 c, 74 c, 31 c, 49 c, 71 c, 48 c, 86 c, 81 c, 16 c, 23 c, 57 c,
5 c, 54 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 1 c, 70 c, 54 c, 71 c, 83 c,
51 c, 54 c, 69 c, 16 c, 92 c, 33 c, 48 c, 61 c, 43 c, 52 c, 1 c, 89 c,
19 c, 67 c, 48 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,

: get_start_element ( i j -- start )
  swap columns * + data + 
;

: north ( base_address -- product )
  4 0 do
    dup c@ swap columns -
  loop
  drop * * *
;
  
: north_east ( base_address -- product )
  4 0 do
    dup c@ swap columns - 1 +
  loop
  drop * * *
;
  
: east ( base_address -- product )
  4 0 do
    dup c@ swap 1 +
  loop
  drop * * *
;
  
: south_east ( base_address -- product )
  4 0 do
    dup c@ swap columns + 1 +
  loop
  drop * * *
;
  
: south ( base_address -- product )
  4 0 do
    dup c@ swap columns +
  loop
  drop * * *
;
  
: south_west ( base_address -- product )
  4 0 do
    dup c@ swap columns + 1 -
  loop
  drop * * *
;
  
: west ( base_address -- product )
  4 0 do
    dup c@ swap 1 -
  loop
  drop * * *
;
  
: north_west ( base_address -- product )
  4 0 do
    dup c@ swap columns - 1 -
  loop
  drop * * *
;
  
: leave_max
  rot 2dup
  <
  if
    swap
  then
  drop swap dup
;

: pe011
 0 stop start do
   stop start do
     i j get_start_element dup
     north leave_max 
     north_east leave_max 
     east leave_max 
     south_east leave_max 
     south leave_max 
     south_west leave_max 
     west leave_max 
     north_west leave_max 
     2drop
   loop 
 loop 
 . cr 
;

pe011
bye
