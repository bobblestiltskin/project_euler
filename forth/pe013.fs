#! /usr/bin/gforth

50 constant col_nums
49 constant col_offset
51 constant put_offset
100 constant row_nums
( maximum sum of any column is 900 - if all elements were 9 )

( result is 52 characters wide )
create result
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c,

create data
3 c, 7 c, 1 c, 0 c, 7 c, 2 c, 8 c, 7 c, 5 c, 3 c, 3 c, 9 c, 0 c, 2 c, 1 c, 0 c, 2 c, 7 c, 9 c, 8 c, 7 c, 9 c, 7 c, 9 c, 9 c, 8 c, 2 c, 2 c, 0 c, 8 c, 3 c, 7 c, 5 c, 9 c, 0 c, 2 c, 4 c, 6 c, 5 c, 1 c, 0 c, 1 c, 3 c, 5 c, 7 c, 4 c, 0 c, 2 c, 5 c, 0 c, 
4 c, 6 c, 3 c, 7 c, 6 c, 9 c, 3 c, 7 c, 6 c, 7 c, 7 c, 4 c, 9 c, 0 c, 0 c, 0 c, 9 c, 7 c, 1 c, 2 c, 6 c, 4 c, 8 c, 1 c, 2 c, 4 c, 8 c, 9 c, 6 c, 9 c, 7 c, 0 c, 0 c, 7 c, 8 c, 0 c, 5 c, 0 c, 4 c, 1 c, 7 c, 0 c, 1 c, 8 c, 2 c, 6 c, 0 c, 5 c, 3 c, 8 c, 
7 c, 4 c, 3 c, 2 c, 4 c, 9 c, 8 c, 6 c, 1 c, 9 c, 9 c, 5 c, 2 c, 4 c, 7 c, 4 c, 1 c, 0 c, 5 c, 9 c, 4 c, 7 c, 4 c, 2 c, 3 c, 3 c, 3 c, 0 c, 9 c, 5 c, 1 c, 3 c, 0 c, 5 c, 8 c, 1 c, 2 c, 3 c, 7 c, 2 c, 6 c, 6 c, 1 c, 7 c, 3 c, 0 c, 9 c, 6 c, 2 c, 9 c, 
9 c, 1 c, 9 c, 4 c, 2 c, 2 c, 1 c, 3 c, 3 c, 6 c, 3 c, 5 c, 7 c, 4 c, 1 c, 6 c, 1 c, 5 c, 7 c, 2 c, 5 c, 2 c, 2 c, 4 c, 3 c, 0 c, 5 c, 6 c, 3 c, 3 c, 0 c, 1 c, 8 c, 1 c, 1 c, 0 c, 7 c, 2 c, 4 c, 0 c, 6 c, 1 c, 5 c, 4 c, 9 c, 0 c, 8 c, 2 c, 5 c, 0 c, 
2 c, 3 c, 0 c, 6 c, 7 c, 5 c, 8 c, 8 c, 2 c, 0 c, 7 c, 5 c, 3 c, 9 c, 3 c, 4 c, 6 c, 1 c, 7 c, 1 c, 1 c, 7 c, 1 c, 9 c, 8 c, 0 c, 3 c, 1 c, 0 c, 4 c, 2 c, 1 c, 0 c, 4 c, 7 c, 5 c, 1 c, 3 c, 7 c, 7 c, 8 c, 0 c, 6 c, 3 c, 2 c, 4 c, 6 c, 6 c, 7 c, 6 c, 
8 c, 9 c, 2 c, 6 c, 1 c, 6 c, 7 c, 0 c, 6 c, 9 c, 6 c, 6 c, 2 c, 3 c, 6 c, 3 c, 3 c, 8 c, 2 c, 0 c, 1 c, 3 c, 6 c, 3 c, 7 c, 8 c, 4 c, 1 c, 8 c, 3 c, 8 c, 3 c, 6 c, 8 c, 4 c, 1 c, 7 c, 8 c, 7 c, 3 c, 4 c, 3 c, 6 c, 1 c, 7 c, 2 c, 6 c, 7 c, 5 c, 7 c, 
2 c, 8 c, 1 c, 1 c, 2 c, 8 c, 7 c, 9 c, 8 c, 1 c, 2 c, 8 c, 4 c, 9 c, 9 c, 7 c, 9 c, 4 c, 0 c, 8 c, 0 c, 6 c, 5 c, 4 c, 8 c, 1 c, 9 c, 3 c, 1 c, 5 c, 9 c, 2 c, 6 c, 2 c, 1 c, 6 c, 9 c, 1 c, 2 c, 7 c, 5 c, 8 c, 8 c, 9 c, 8 c, 3 c, 2 c, 7 c, 3 c, 8 c, 
4 c, 4 c, 2 c, 7 c, 4 c, 2 c, 2 c, 8 c, 9 c, 1 c, 7 c, 4 c, 3 c, 2 c, 5 c, 2 c, 0 c, 3 c, 2 c, 1 c, 9 c, 2 c, 3 c, 5 c, 8 c, 9 c, 4 c, 2 c, 2 c, 8 c, 7 c, 6 c, 7 c, 9 c, 6 c, 4 c, 8 c, 7 c, 6 c, 7 c, 0 c, 2 c, 7 c, 2 c, 1 c, 8 c, 9 c, 3 c, 1 c, 8 c, 
4 c, 7 c, 4 c, 5 c, 1 c, 4 c, 4 c, 5 c, 7 c, 3 c, 6 c, 0 c, 0 c, 1 c, 3 c, 0 c, 6 c, 4 c, 3 c, 9 c, 0 c, 9 c, 1 c, 1 c, 6 c, 7 c, 2 c, 1 c, 6 c, 8 c, 5 c, 6 c, 8 c, 4 c, 4 c, 5 c, 8 c, 8 c, 7 c, 1 c, 1 c, 6 c, 0 c, 3 c, 1 c, 5 c, 3 c, 2 c, 7 c, 6 c, 
7 c, 0 c, 3 c, 8 c, 6 c, 4 c, 8 c, 6 c, 1 c, 0 c, 5 c, 8 c, 4 c, 3 c, 0 c, 2 c, 5 c, 4 c, 3 c, 9 c, 9 c, 3 c, 9 c, 6 c, 1 c, 9 c, 8 c, 2 c, 8 c, 9 c, 1 c, 7 c, 5 c, 9 c, 3 c, 6 c, 6 c, 5 c, 6 c, 8 c, 6 c, 7 c, 5 c, 7 c, 9 c, 3 c, 4 c, 9 c, 5 c, 1 c, 
6 c, 2 c, 1 c, 7 c, 6 c, 4 c, 5 c, 7 c, 1 c, 4 c, 1 c, 8 c, 5 c, 6 c, 5 c, 6 c, 0 c, 6 c, 2 c, 9 c, 5 c, 0 c, 2 c, 1 c, 5 c, 7 c, 2 c, 2 c, 3 c, 1 c, 9 c, 6 c, 5 c, 8 c, 6 c, 7 c, 5 c, 5 c, 0 c, 7 c, 9 c, 3 c, 2 c, 4 c, 1 c, 9 c, 3 c, 3 c, 3 c, 1 c, 
6 c, 4 c, 9 c, 0 c, 6 c, 3 c, 5 c, 2 c, 4 c, 6 c, 2 c, 7 c, 4 c, 1 c, 9 c, 0 c, 4 c, 9 c, 2 c, 9 c, 1 c, 0 c, 1 c, 4 c, 3 c, 2 c, 4 c, 4 c, 5 c, 8 c, 1 c, 3 c, 8 c, 2 c, 2 c, 6 c, 6 c, 3 c, 3 c, 4 c, 7 c, 9 c, 4 c, 4 c, 7 c, 5 c, 8 c, 1 c, 7 c, 8 c, 
9 c, 2 c, 5 c, 7 c, 5 c, 8 c, 6 c, 7 c, 7 c, 1 c, 8 c, 3 c, 3 c, 7 c, 2 c, 1 c, 7 c, 6 c, 6 c, 1 c, 9 c, 6 c, 3 c, 7 c, 5 c, 1 c, 5 c, 9 c, 0 c, 5 c, 7 c, 9 c, 2 c, 3 c, 9 c, 7 c, 2 c, 8 c, 2 c, 4 c, 5 c, 5 c, 9 c, 8 c, 8 c, 3 c, 8 c, 4 c, 0 c, 7 c, 
5 c, 8 c, 2 c, 0 c, 3 c, 5 c, 6 c, 5 c, 3 c, 2 c, 5 c, 3 c, 5 c, 9 c, 3 c, 9 c, 9 c, 0 c, 0 c, 8 c, 4 c, 0 c, 2 c, 6 c, 3 c, 3 c, 5 c, 6 c, 8 c, 9 c, 4 c, 8 c, 8 c, 3 c, 0 c, 1 c, 8 c, 9 c, 4 c, 5 c, 8 c, 6 c, 2 c, 8 c, 2 c, 2 c, 7 c, 8 c, 2 c, 8 c, 
8 c, 0 c, 1 c, 8 c, 1 c, 1 c, 9 c, 9 c, 3 c, 8 c, 4 c, 8 c, 2 c, 6 c, 2 c, 8 c, 2 c, 0 c, 1 c, 4 c, 2 c, 7 c, 8 c, 1 c, 9 c, 4 c, 1 c, 3 c, 9 c, 9 c, 4 c, 0 c, 5 c, 6 c, 7 c, 5 c, 8 c, 7 c, 1 c, 5 c, 1 c, 1 c, 7 c, 0 c, 0 c, 9 c, 4 c, 3 c, 9 c, 0 c, 
3 c, 5 c, 3 c, 9 c, 8 c, 6 c, 6 c, 4 c, 3 c, 7 c, 2 c, 8 c, 2 c, 7 c, 1 c, 1 c, 2 c, 6 c, 5 c, 3 c, 8 c, 2 c, 9 c, 9 c, 8 c, 7 c, 2 c, 4 c, 0 c, 7 c, 8 c, 4 c, 4 c, 7 c, 3 c, 0 c, 5 c, 3 c, 1 c, 9 c, 0 c, 1 c, 0 c, 4 c, 2 c, 9 c, 3 c, 5 c, 8 c, 6 c, 
8 c, 6 c, 5 c, 1 c, 5 c, 5 c, 0 c, 6 c, 0 c, 0 c, 6 c, 2 c, 9 c, 5 c, 8 c, 6 c, 4 c, 8 c, 6 c, 1 c, 5 c, 3 c, 2 c, 0 c, 7 c, 5 c, 2 c, 7 c, 3 c, 3 c, 7 c, 1 c, 9 c, 5 c, 9 c, 1 c, 9 c, 1 c, 4 c, 2 c, 0 c, 5 c, 1 c, 7 c, 2 c, 5 c, 5 c, 8 c, 2 c, 9 c, 
7 c, 1 c, 6 c, 9 c, 3 c, 8 c, 8 c, 8 c, 7 c, 0 c, 7 c, 7 c, 1 c, 5 c, 4 c, 6 c, 6 c, 4 c, 9 c, 9 c, 1 c, 1 c, 5 c, 5 c, 9 c, 3 c, 4 c, 8 c, 7 c, 6 c, 0 c, 3 c, 5 c, 3 c, 2 c, 9 c, 2 c, 1 c, 7 c, 1 c, 4 c, 9 c, 7 c, 0 c, 0 c, 5 c, 6 c, 9 c, 3 c, 8 c, 
5 c, 4 c, 3 c, 7 c, 0 c, 0 c, 7 c, 0 c, 5 c, 7 c, 6 c, 8 c, 2 c, 6 c, 6 c, 8 c, 4 c, 6 c, 2 c, 4 c, 6 c, 2 c, 1 c, 4 c, 9 c, 5 c, 6 c, 5 c, 0 c, 0 c, 7 c, 6 c, 4 c, 7 c, 1 c, 7 c, 8 c, 7 c, 2 c, 9 c, 4 c, 4 c, 3 c, 8 c, 3 c, 7 c, 7 c, 6 c, 0 c, 4 c, 
5 c, 3 c, 2 c, 8 c, 2 c, 6 c, 5 c, 4 c, 1 c, 0 c, 8 c, 7 c, 5 c, 6 c, 8 c, 2 c, 8 c, 4 c, 4 c, 3 c, 1 c, 9 c, 1 c, 1 c, 9 c, 0 c, 6 c, 3 c, 4 c, 6 c, 9 c, 4 c, 0 c, 3 c, 7 c, 8 c, 5 c, 5 c, 2 c, 1 c, 7 c, 7 c, 7 c, 9 c, 2 c, 9 c, 5 c, 1 c, 4 c, 5 c, 
3 c, 6 c, 1 c, 2 c, 3 c, 2 c, 7 c, 2 c, 5 c, 2 c, 5 c, 0 c, 0 c, 0 c, 2 c, 9 c, 6 c, 0 c, 7 c, 1 c, 0 c, 7 c, 5 c, 0 c, 8 c, 2 c, 5 c, 6 c, 3 c, 8 c, 1 c, 5 c, 6 c, 5 c, 6 c, 7 c, 1 c, 0 c, 8 c, 8 c, 5 c, 2 c, 5 c, 8 c, 3 c, 5 c, 0 c, 7 c, 2 c, 1 c, 
4 c, 5 c, 8 c, 7 c, 6 c, 5 c, 7 c, 6 c, 1 c, 7 c, 2 c, 4 c, 1 c, 0 c, 9 c, 7 c, 6 c, 4 c, 4 c, 7 c, 3 c, 3 c, 9 c, 1 c, 1 c, 0 c, 6 c, 0 c, 7 c, 2 c, 1 c, 8 c, 2 c, 6 c, 5 c, 2 c, 3 c, 6 c, 8 c, 7 c, 7 c, 2 c, 2 c, 3 c, 6 c, 3 c, 6 c, 0 c, 4 c, 5 c, 
1 c, 7 c, 4 c, 2 c, 3 c, 7 c, 0 c, 6 c, 9 c, 0 c, 5 c, 8 c, 5 c, 1 c, 8 c, 6 c, 0 c, 6 c, 6 c, 0 c, 4 c, 4 c, 8 c, 2 c, 0 c, 7 c, 6 c, 2 c, 1 c, 2 c, 0 c, 9 c, 8 c, 1 c, 3 c, 2 c, 8 c, 7 c, 8 c, 6 c, 0 c, 7 c, 3 c, 3 c, 9 c, 6 c, 9 c, 4 c, 1 c, 2 c, 
8 c, 1 c, 1 c, 4 c, 2 c, 6 c, 6 c, 0 c, 4 c, 1 c, 8 c, 0 c, 8 c, 6 c, 8 c, 3 c, 0 c, 6 c, 1 c, 9 c, 3 c, 2 c, 8 c, 4 c, 6 c, 0 c, 8 c, 1 c, 1 c, 1 c, 9 c, 1 c, 0 c, 6 c, 1 c, 5 c, 5 c, 6 c, 9 c, 4 c, 0 c, 5 c, 1 c, 2 c, 6 c, 8 c, 9 c, 6 c, 9 c, 2 c, 
5 c, 1 c, 9 c, 3 c, 4 c, 3 c, 2 c, 5 c, 4 c, 5 c, 1 c, 7 c, 2 c, 8 c, 3 c, 8 c, 8 c, 6 c, 4 c, 1 c, 9 c, 1 c, 8 c, 0 c, 4 c, 7 c, 0 c, 4 c, 9 c, 2 c, 9 c, 3 c, 2 c, 1 c, 5 c, 0 c, 5 c, 8 c, 6 c, 4 c, 2 c, 5 c, 6 c, 3 c, 0 c, 4 c, 9 c, 4 c, 8 c, 3 c, 
6 c, 2 c, 4 c, 6 c, 7 c, 2 c, 2 c, 1 c, 6 c, 4 c, 8 c, 4 c, 3 c, 5 c, 0 c, 7 c, 6 c, 2 c, 0 c, 1 c, 7 c, 2 c, 7 c, 9 c, 1 c, 8 c, 0 c, 3 c, 9 c, 9 c, 4 c, 4 c, 6 c, 9 c, 3 c, 0 c, 0 c, 4 c, 7 c, 3 c, 2 c, 9 c, 5 c, 6 c, 3 c, 4 c, 0 c, 6 c, 9 c, 1 c, 
1 c, 5 c, 7 c, 3 c, 2 c, 4 c, 4 c, 4 c, 3 c, 8 c, 6 c, 9 c, 0 c, 8 c, 1 c, 2 c, 5 c, 7 c, 9 c, 4 c, 5 c, 1 c, 4 c, 0 c, 8 c, 9 c, 0 c, 5 c, 7 c, 7 c, 0 c, 6 c, 2 c, 2 c, 9 c, 4 c, 2 c, 9 c, 1 c, 9 c, 7 c, 1 c, 0 c, 7 c, 9 c, 2 c, 8 c, 2 c, 0 c, 9 c, 
5 c, 5 c, 0 c, 3 c, 7 c, 6 c, 8 c, 7 c, 5 c, 2 c, 5 c, 6 c, 7 c, 8 c, 7 c, 7 c, 3 c, 0 c, 9 c, 1 c, 8 c, 6 c, 2 c, 5 c, 4 c, 0 c, 7 c, 4 c, 4 c, 9 c, 6 c, 9 c, 8 c, 4 c, 4 c, 5 c, 0 c, 8 c, 3 c, 3 c, 0 c, 3 c, 9 c, 3 c, 6 c, 8 c, 2 c, 1 c, 2 c, 6 c, 
1 c, 8 c, 3 c, 3 c, 6 c, 3 c, 8 c, 4 c, 8 c, 2 c, 5 c, 3 c, 3 c, 0 c, 1 c, 5 c, 4 c, 6 c, 8 c, 6 c, 1 c, 9 c, 6 c, 1 c, 2 c, 4 c, 3 c, 4 c, 8 c, 7 c, 6 c, 7 c, 6 c, 8 c, 1 c, 2 c, 9 c, 7 c, 5 c, 3 c, 4 c, 3 c, 7 c, 5 c, 9 c, 4 c, 6 c, 5 c, 1 c, 5 c, 
8 c, 0 c, 3 c, 8 c, 6 c, 2 c, 8 c, 7 c, 5 c, 9 c, 2 c, 8 c, 7 c, 8 c, 4 c, 9 c, 0 c, 2 c, 0 c, 1 c, 5 c, 2 c, 1 c, 6 c, 8 c, 5 c, 5 c, 5 c, 4 c, 8 c, 2 c, 8 c, 7 c, 1 c, 7 c, 2 c, 0 c, 1 c, 2 c, 1 c, 9 c, 2 c, 5 c, 7 c, 7 c, 6 c, 6 c, 9 c, 5 c, 4 c, 
7 c, 8 c, 1 c, 8 c, 2 c, 8 c, 3 c, 3 c, 7 c, 5 c, 7 c, 9 c, 9 c, 3 c, 1 c, 0 c, 3 c, 6 c, 1 c, 4 c, 7 c, 4 c, 0 c, 3 c, 5 c, 6 c, 8 c, 5 c, 6 c, 4 c, 4 c, 9 c, 0 c, 9 c, 5 c, 5 c, 2 c, 7 c, 0 c, 9 c, 7 c, 8 c, 6 c, 4 c, 7 c, 9 c, 7 c, 5 c, 8 c, 1 c, 
1 c, 6 c, 7 c, 2 c, 6 c, 3 c, 2 c, 0 c, 1 c, 0 c, 0 c, 4 c, 3 c, 6 c, 8 c, 9 c, 7 c, 8 c, 4 c, 2 c, 5 c, 5 c, 3 c, 5 c, 3 c, 9 c, 9 c, 2 c, 0 c, 9 c, 3 c, 1 c, 8 c, 3 c, 7 c, 4 c, 4 c, 1 c, 4 c, 9 c, 7 c, 8 c, 0 c, 6 c, 8 c, 6 c, 0 c, 9 c, 8 c, 4 c, 
4 c, 8 c, 4 c, 0 c, 3 c, 0 c, 9 c, 8 c, 1 c, 2 c, 9 c, 0 c, 7 c, 7 c, 7 c, 9 c, 1 c, 7 c, 9 c, 9 c, 0 c, 8 c, 8 c, 2 c, 1 c, 8 c, 7 c, 9 c, 5 c, 3 c, 2 c, 7 c, 3 c, 6 c, 4 c, 4 c, 7 c, 5 c, 6 c, 7 c, 5 c, 5 c, 9 c, 0 c, 8 c, 4 c, 8 c, 0 c, 3 c, 0 c, 
8 c, 7 c, 0 c, 8 c, 6 c, 9 c, 8 c, 7 c, 5 c, 5 c, 1 c, 3 c, 9 c, 2 c, 7 c, 1 c, 1 c, 8 c, 5 c, 4 c, 5 c, 1 c, 7 c, 0 c, 7 c, 8 c, 5 c, 4 c, 4 c, 1 c, 6 c, 1 c, 8 c, 5 c, 2 c, 4 c, 2 c, 4 c, 3 c, 2 c, 0 c, 6 c, 9 c, 3 c, 1 c, 5 c, 0 c, 3 c, 3 c, 2 c, 
5 c, 9 c, 9 c, 5 c, 9 c, 4 c, 0 c, 6 c, 8 c, 9 c, 5 c, 7 c, 5 c, 6 c, 5 c, 3 c, 6 c, 7 c, 8 c, 2 c, 1 c, 0 c, 7 c, 0 c, 7 c, 4 c, 9 c, 2 c, 6 c, 9 c, 6 c, 6 c, 5 c, 3 c, 7 c, 6 c, 7 c, 6 c, 3 c, 2 c, 6 c, 2 c, 3 c, 5 c, 4 c, 4 c, 7 c, 2 c, 1 c, 0 c, 
6 c, 9 c, 7 c, 9 c, 3 c, 9 c, 5 c, 0 c, 6 c, 7 c, 9 c, 6 c, 5 c, 2 c, 6 c, 9 c, 4 c, 7 c, 4 c, 2 c, 5 c, 9 c, 7 c, 7 c, 0 c, 9 c, 7 c, 3 c, 9 c, 1 c, 6 c, 6 c, 6 c, 9 c, 3 c, 7 c, 6 c, 3 c, 0 c, 4 c, 2 c, 6 c, 3 c, 3 c, 9 c, 8 c, 7 c, 0 c, 8 c, 5 c, 
4 c, 1 c, 0 c, 5 c, 2 c, 6 c, 8 c, 4 c, 7 c, 0 c, 8 c, 2 c, 9 c, 9 c, 0 c, 8 c, 5 c, 2 c, 1 c, 1 c, 3 c, 9 c, 9 c, 4 c, 2 c, 7 c, 3 c, 6 c, 5 c, 7 c, 3 c, 4 c, 1 c, 1 c, 6 c, 1 c, 8 c, 2 c, 7 c, 6 c, 0 c, 3 c, 1 c, 5 c, 0 c, 0 c, 1 c, 2 c, 7 c, 1 c, 
6 c, 5 c, 3 c, 7 c, 8 c, 6 c, 0 c, 7 c, 3 c, 6 c, 1 c, 5 c, 0 c, 1 c, 0 c, 8 c, 0 c, 8 c, 5 c, 7 c, 0 c, 0 c, 9 c, 1 c, 4 c, 9 c, 9 c, 3 c, 9 c, 5 c, 1 c, 2 c, 5 c, 5 c, 7 c, 0 c, 2 c, 8 c, 1 c, 9 c, 8 c, 7 c, 4 c, 6 c, 0 c, 0 c, 4 c, 3 c, 7 c, 5 c, 
3 c, 5 c, 8 c, 2 c, 9 c, 0 c, 3 c, 5 c, 3 c, 1 c, 7 c, 4 c, 3 c, 4 c, 7 c, 1 c, 7 c, 3 c, 2 c, 6 c, 9 c, 3 c, 2 c, 1 c, 2 c, 3 c, 5 c, 7 c, 8 c, 1 c, 5 c, 4 c, 9 c, 8 c, 2 c, 6 c, 2 c, 9 c, 7 c, 4 c, 2 c, 5 c, 5 c, 2 c, 7 c, 3 c, 7 c, 3 c, 0 c, 7 c, 
9 c, 4 c, 9 c, 5 c, 3 c, 7 c, 5 c, 9 c, 7 c, 6 c, 5 c, 1 c, 0 c, 5 c, 3 c, 0 c, 5 c, 9 c, 4 c, 6 c, 9 c, 6 c, 6 c, 0 c, 6 c, 7 c, 6 c, 8 c, 3 c, 1 c, 5 c, 6 c, 5 c, 7 c, 4 c, 3 c, 7 c, 7 c, 1 c, 6 c, 7 c, 4 c, 0 c, 1 c, 8 c, 7 c, 5 c, 2 c, 7 c, 5 c, 
8 c, 8 c, 9 c, 0 c, 2 c, 8 c, 0 c, 2 c, 5 c, 7 c, 1 c, 7 c, 3 c, 3 c, 2 c, 2 c, 9 c, 6 c, 1 c, 9 c, 1 c, 7 c, 6 c, 6 c, 6 c, 8 c, 7 c, 1 c, 3 c, 8 c, 1 c, 9 c, 9 c, 3 c, 1 c, 8 c, 1 c, 1 c, 0 c, 4 c, 8 c, 7 c, 7 c, 0 c, 1 c, 9 c, 0 c, 2 c, 7 c, 1 c, 
2 c, 5 c, 2 c, 6 c, 7 c, 6 c, 8 c, 0 c, 2 c, 7 c, 6 c, 0 c, 7 c, 8 c, 0 c, 0 c, 3 c, 0 c, 1 c, 3 c, 6 c, 7 c, 8 c, 6 c, 8 c, 0 c, 9 c, 9 c, 2 c, 5 c, 2 c, 5 c, 4 c, 6 c, 3 c, 4 c, 0 c, 1 c, 0 c, 6 c, 1 c, 6 c, 3 c, 2 c, 8 c, 6 c, 6 c, 5 c, 2 c, 6 c, 
3 c, 6 c, 2 c, 7 c, 0 c, 2 c, 1 c, 8 c, 5 c, 4 c, 0 c, 4 c, 9 c, 7 c, 7 c, 0 c, 5 c, 5 c, 8 c, 5 c, 6 c, 2 c, 9 c, 9 c, 4 c, 6 c, 5 c, 8 c, 0 c, 6 c, 3 c, 6 c, 2 c, 3 c, 7 c, 9 c, 9 c, 3 c, 1 c, 4 c, 0 c, 7 c, 4 c, 6 c, 2 c, 5 c, 5 c, 9 c, 6 c, 2 c, 
2 c, 4 c, 0 c, 7 c, 4 c, 4 c, 8 c, 6 c, 9 c, 0 c, 8 c, 2 c, 3 c, 1 c, 1 c, 7 c, 4 c, 9 c, 7 c, 7 c, 7 c, 9 c, 2 c, 3 c, 6 c, 5 c, 4 c, 6 c, 6 c, 2 c, 5 c, 7 c, 2 c, 4 c, 6 c, 9 c, 2 c, 3 c, 3 c, 2 c, 2 c, 8 c, 1 c, 0 c, 9 c, 1 c, 7 c, 1 c, 4 c, 1 c, 
9 c, 1 c, 4 c, 3 c, 0 c, 2 c, 8 c, 8 c, 1 c, 9 c, 7 c, 1 c, 0 c, 3 c, 2 c, 8 c, 8 c, 5 c, 9 c, 7 c, 8 c, 0 c, 6 c, 6 c, 6 c, 9 c, 7 c, 6 c, 0 c, 8 c, 9 c, 2 c, 9 c, 3 c, 8 c, 6 c, 3 c, 8 c, 2 c, 8 c, 5 c, 0 c, 2 c, 5 c, 3 c, 3 c, 3 c, 4 c, 0 c, 3 c, 
3 c, 4 c, 4 c, 1 c, 3 c, 0 c, 6 c, 5 c, 5 c, 7 c, 8 c, 0 c, 1 c, 6 c, 1 c, 2 c, 7 c, 8 c, 1 c, 5 c, 9 c, 2 c, 1 c, 8 c, 1 c, 5 c, 0 c, 0 c, 5 c, 5 c, 6 c, 1 c, 8 c, 6 c, 8 c, 8 c, 3 c, 6 c, 4 c, 6 c, 8 c, 4 c, 2 c, 0 c, 0 c, 9 c, 0 c, 4 c, 7 c, 0 c, 
2 c, 3 c, 0 c, 5 c, 3 c, 0 c, 8 c, 1 c, 1 c, 7 c, 2 c, 8 c, 1 c, 6 c, 4 c, 3 c, 0 c, 4 c, 8 c, 7 c, 6 c, 2 c, 3 c, 7 c, 9 c, 1 c, 9 c, 6 c, 9 c, 8 c, 4 c, 2 c, 4 c, 8 c, 7 c, 2 c, 5 c, 5 c, 0 c, 3 c, 6 c, 6 c, 3 c, 8 c, 7 c, 8 c, 4 c, 5 c, 8 c, 3 c, 
1 c, 1 c, 4 c, 8 c, 7 c, 6 c, 9 c, 6 c, 9 c, 3 c, 2 c, 1 c, 5 c, 4 c, 9 c, 0 c, 2 c, 8 c, 1 c, 0 c, 4 c, 2 c, 4 c, 0 c, 2 c, 0 c, 1 c, 3 c, 8 c, 3 c, 3 c, 5 c, 1 c, 2 c, 4 c, 4 c, 6 c, 2 c, 1 c, 8 c, 1 c, 4 c, 4 c, 1 c, 7 c, 7 c, 3 c, 4 c, 7 c, 0 c, 
6 c, 3 c, 7 c, 8 c, 3 c, 2 c, 9 c, 9 c, 4 c, 9 c, 0 c, 6 c, 3 c, 6 c, 2 c, 5 c, 9 c, 6 c, 6 c, 6 c, 4 c, 9 c, 8 c, 5 c, 8 c, 7 c, 6 c, 1 c, 8 c, 2 c, 2 c, 1 c, 2 c, 2 c, 5 c, 2 c, 2 c, 5 c, 5 c, 1 c, 2 c, 4 c, 8 c, 6 c, 7 c, 6 c, 4 c, 5 c, 3 c, 3 c, 
6 c, 7 c, 7 c, 2 c, 0 c, 1 c, 8 c, 6 c, 9 c, 7 c, 1 c, 6 c, 9 c, 8 c, 5 c, 4 c, 4 c, 3 c, 1 c, 2 c, 4 c, 1 c, 9 c, 5 c, 7 c, 2 c, 4 c, 0 c, 9 c, 9 c, 1 c, 3 c, 9 c, 5 c, 9 c, 0 c, 0 c, 8 c, 9 c, 5 c, 2 c, 3 c, 1 c, 0 c, 0 c, 5 c, 8 c, 8 c, 2 c, 2 c, 
9 c, 5 c, 5 c, 4 c, 8 c, 2 c, 5 c, 5 c, 3 c, 0 c, 0 c, 2 c, 6 c, 3 c, 5 c, 2 c, 0 c, 7 c, 8 c, 1 c, 5 c, 3 c, 2 c, 2 c, 9 c, 6 c, 7 c, 9 c, 6 c, 2 c, 4 c, 9 c, 4 c, 8 c, 1 c, 6 c, 4 c, 1 c, 9 c, 5 c, 3 c, 8 c, 6 c, 8 c, 2 c, 1 c, 8 c, 7 c, 7 c, 4 c, 
7 c, 6 c, 0 c, 8 c, 5 c, 3 c, 2 c, 7 c, 1 c, 3 c, 2 c, 2 c, 8 c, 5 c, 7 c, 2 c, 3 c, 1 c, 1 c, 0 c, 4 c, 2 c, 4 c, 8 c, 0 c, 3 c, 4 c, 5 c, 6 c, 1 c, 2 c, 4 c, 8 c, 6 c, 7 c, 6 c, 9 c, 7 c, 0 c, 6 c, 4 c, 5 c, 0 c, 7 c, 9 c, 9 c, 5 c, 2 c, 3 c, 6 c, 
3 c, 7 c, 7 c, 7 c, 4 c, 2 c, 4 c, 2 c, 5 c, 3 c, 5 c, 4 c, 1 c, 1 c, 2 c, 9 c, 1 c, 6 c, 8 c, 4 c, 2 c, 7 c, 6 c, 8 c, 6 c, 5 c, 5 c, 3 c, 8 c, 9 c, 2 c, 6 c, 2 c, 0 c, 5 c, 0 c, 2 c, 4 c, 9 c, 1 c, 0 c, 3 c, 2 c, 6 c, 5 c, 7 c, 2 c, 9 c, 6 c, 7 c, 
2 c, 3 c, 7 c, 0 c, 1 c, 9 c, 1 c, 3 c, 2 c, 7 c, 5 c, 7 c, 2 c, 5 c, 6 c, 7 c, 5 c, 2 c, 8 c, 5 c, 6 c, 5 c, 3 c, 2 c, 4 c, 8 c, 2 c, 5 c, 8 c, 2 c, 6 c, 5 c, 4 c, 6 c, 3 c, 0 c, 9 c, 2 c, 2 c, 0 c, 7 c, 0 c, 5 c, 8 c, 5 c, 9 c, 6 c, 5 c, 2 c, 2 c, 
2 c, 9 c, 7 c, 9 c, 8 c, 8 c, 6 c, 0 c, 2 c, 7 c, 2 c, 2 c, 5 c, 8 c, 3 c, 3 c, 1 c, 9 c, 1 c, 3 c, 1 c, 2 c, 6 c, 3 c, 7 c, 5 c, 1 c, 4 c, 7 c, 3 c, 4 c, 1 c, 9 c, 9 c, 4 c, 8 c, 8 c, 9 c, 5 c, 3 c, 4 c, 7 c, 6 c, 5 c, 7 c, 4 c, 5 c, 5 c, 0 c, 1 c, 
1 c, 8 c, 4 c, 9 c, 5 c, 7 c, 0 c, 1 c, 4 c, 5 c, 4 c, 8 c, 7 c, 9 c, 2 c, 8 c, 8 c, 9 c, 8 c, 4 c, 8 c, 5 c, 6 c, 8 c, 2 c, 7 c, 7 c, 2 c, 6 c, 0 c, 7 c, 7 c, 7 c, 1 c, 3 c, 7 c, 2 c, 1 c, 4 c, 0 c, 3 c, 7 c, 9 c, 8 c, 8 c, 7 c, 9 c, 7 c, 1 c, 5 c, 
3 c, 8 c, 2 c, 9 c, 8 c, 2 c, 0 c, 3 c, 7 c, 8 c, 3 c, 0 c, 3 c, 1 c, 4 c, 7 c, 3 c, 5 c, 2 c, 7 c, 7 c, 2 c, 1 c, 5 c, 8 c, 0 c, 3 c, 4 c, 8 c, 1 c, 4 c, 4 c, 5 c, 1 c, 3 c, 4 c, 9 c, 1 c, 3 c, 7 c, 3 c, 2 c, 2 c, 6 c, 6 c, 5 c, 1 c, 3 c, 8 c, 1 c, 
3 c, 4 c, 8 c, 2 c, 9 c, 5 c, 4 c, 3 c, 8 c, 2 c, 9 c, 1 c, 9 c, 9 c, 9 c, 1 c, 8 c, 1 c, 8 c, 0 c, 2 c, 7 c, 8 c, 9 c, 1 c, 6 c, 5 c, 2 c, 2 c, 4 c, 3 c, 1 c, 0 c, 2 c, 7 c, 3 c, 9 c, 2 c, 2 c, 5 c, 1 c, 1 c, 2 c, 2 c, 8 c, 6 c, 9 c, 5 c, 3 c, 9 c, 
4 c, 0 c, 9 c, 5 c, 7 c, 9 c, 5 c, 3 c, 0 c, 6 c, 6 c, 4 c, 0 c, 5 c, 2 c, 3 c, 2 c, 6 c, 3 c, 2 c, 5 c, 3 c, 8 c, 0 c, 4 c, 4 c, 1 c, 0 c, 0 c, 0 c, 5 c, 9 c, 6 c, 5 c, 4 c, 9 c, 3 c, 9 c, 1 c, 5 c, 9 c, 8 c, 7 c, 9 c, 5 c, 9 c, 3 c, 6 c, 3 c, 5 c, 
2 c, 9 c, 7 c, 4 c, 6 c, 1 c, 5 c, 2 c, 1 c, 8 c, 5 c, 5 c, 0 c, 2 c, 3 c, 7 c, 1 c, 3 c, 0 c, 7 c, 6 c, 4 c, 2 c, 2 c, 5 c, 5 c, 1 c, 2 c, 1 c, 1 c, 8 c, 3 c, 6 c, 9 c, 3 c, 8 c, 0 c, 3 c, 5 c, 8 c, 0 c, 3 c, 8 c, 8 c, 5 c, 8 c, 4 c, 9 c, 0 c, 3 c, 
4 c, 1 c, 6 c, 9 c, 8 c, 1 c, 1 c, 6 c, 2 c, 2 c, 2 c, 0 c, 7 c, 2 c, 9 c, 7 c, 7 c, 1 c, 8 c, 6 c, 1 c, 5 c, 8 c, 2 c, 3 c, 6 c, 6 c, 7 c, 8 c, 4 c, 2 c, 4 c, 6 c, 8 c, 9 c, 1 c, 5 c, 7 c, 9 c, 9 c, 3 c, 5 c, 3 c, 2 c, 9 c, 6 c, 1 c, 9 c, 2 c, 2 c, 
6 c, 2 c, 4 c, 6 c, 7 c, 9 c, 5 c, 7 c, 1 c, 9 c, 4 c, 4 c, 0 c, 1 c, 2 c, 6 c, 9 c, 0 c, 4 c, 3 c, 8 c, 7 c, 7 c, 1 c, 0 c, 7 c, 2 c, 7 c, 5 c, 0 c, 4 c, 8 c, 1 c, 0 c, 2 c, 3 c, 9 c, 0 c, 8 c, 9 c, 5 c, 5 c, 2 c, 3 c, 5 c, 9 c, 7 c, 4 c, 5 c, 7 c, 
2 c, 3 c, 1 c, 8 c, 9 c, 7 c, 0 c, 6 c, 7 c, 7 c, 2 c, 5 c, 4 c, 7 c, 9 c, 1 c, 5 c, 0 c, 6 c, 1 c, 5 c, 0 c, 5 c, 5 c, 0 c, 4 c, 9 c, 5 c, 3 c, 9 c, 2 c, 2 c, 9 c, 7 c, 9 c, 5 c, 3 c, 0 c, 9 c, 0 c, 1 c, 1 c, 2 c, 9 c, 9 c, 6 c, 7 c, 5 c, 1 c, 9 c, 
8 c, 6 c, 1 c, 8 c, 8 c, 0 c, 8 c, 8 c, 2 c, 2 c, 5 c, 8 c, 7 c, 5 c, 3 c, 1 c, 4 c, 5 c, 2 c, 9 c, 5 c, 8 c, 4 c, 0 c, 9 c, 9 c, 2 c, 5 c, 1 c, 2 c, 0 c, 3 c, 8 c, 2 c, 9 c, 0 c, 0 c, 9 c, 4 c, 0 c, 7 c, 7 c, 7 c, 0 c, 7 c, 7 c, 5 c, 6 c, 7 c, 2 c, 
1 c, 1 c, 3 c, 0 c, 6 c, 7 c, 3 c, 9 c, 7 c, 0 c, 8 c, 3 c, 0 c, 4 c, 7 c, 2 c, 4 c, 4 c, 8 c, 3 c, 8 c, 1 c, 6 c, 5 c, 3 c, 3 c, 8 c, 7 c, 3 c, 5 c, 0 c, 2 c, 3 c, 4 c, 0 c, 8 c, 4 c, 5 c, 6 c, 4 c, 7 c, 0 c, 5 c, 8 c, 0 c, 7 c, 7 c, 3 c, 0 c, 8 c, 
8 c, 2 c, 9 c, 5 c, 9 c, 1 c, 7 c, 4 c, 7 c, 6 c, 7 c, 1 c, 4 c, 0 c, 3 c, 6 c, 3 c, 1 c, 9 c, 8 c, 0 c, 0 c, 8 c, 1 c, 8 c, 7 c, 1 c, 2 c, 9 c, 0 c, 1 c, 1 c, 8 c, 7 c, 5 c, 4 c, 9 c, 1 c, 3 c, 1 c, 0 c, 5 c, 4 c, 7 c, 1 c, 2 c, 6 c, 5 c, 8 c, 1 c, 
9 c, 7 c, 6 c, 2 c, 3 c, 3 c, 3 c, 1 c, 0 c, 4 c, 4 c, 8 c, 1 c, 8 c, 3 c, 8 c, 6 c, 2 c, 6 c, 9 c, 5 c, 1 c, 5 c, 4 c, 5 c, 6 c, 3 c, 3 c, 4 c, 9 c, 2 c, 6 c, 3 c, 6 c, 6 c, 5 c, 7 c, 2 c, 8 c, 9 c, 7 c, 5 c, 6 c, 3 c, 4 c, 0 c, 0 c, 5 c, 0 c, 0 c, 
4 c, 2 c, 8 c, 4 c, 6 c, 2 c, 8 c, 0 c, 1 c, 8 c, 3 c, 5 c, 1 c, 7 c, 0 c, 7 c, 0 c, 5 c, 2 c, 7 c, 8 c, 3 c, 1 c, 8 c, 3 c, 9 c, 4 c, 2 c, 5 c, 8 c, 8 c, 2 c, 1 c, 4 c, 5 c, 5 c, 2 c, 1 c, 2 c, 2 c, 7 c, 2 c, 5 c, 1 c, 2 c, 5 c, 0 c, 3 c, 2 c, 7 c, 
5 c, 5 c, 1 c, 2 c, 1 c, 6 c, 0 c, 3 c, 5 c, 4 c, 6 c, 9 c, 8 c, 1 c, 2 c, 0 c, 0 c, 5 c, 8 c, 1 c, 7 c, 6 c, 2 c, 1 c, 6 c, 5 c, 2 c, 1 c, 2 c, 8 c, 2 c, 7 c, 6 c, 5 c, 2 c, 7 c, 5 c, 1 c, 6 c, 9 c, 1 c, 2 c, 9 c, 6 c, 8 c, 9 c, 7 c, 7 c, 8 c, 9 c, 
3 c, 2 c, 2 c, 3 c, 8 c, 1 c, 9 c, 5 c, 7 c, 3 c, 4 c, 3 c, 2 c, 9 c, 3 c, 3 c, 9 c, 9 c, 4 c, 6 c, 4 c, 3 c, 7 c, 5 c, 0 c, 1 c, 9 c, 0 c, 7 c, 8 c, 3 c, 6 c, 9 c, 4 c, 5 c, 7 c, 6 c, 5 c, 8 c, 8 c, 3 c, 3 c, 5 c, 2 c, 3 c, 9 c, 9 c, 8 c, 8 c, 6 c, 
7 c, 5 c, 5 c, 0 c, 6 c, 1 c, 6 c, 4 c, 9 c, 6 c, 5 c, 1 c, 8 c, 4 c, 7 c, 7 c, 5 c, 1 c, 8 c, 0 c, 7 c, 3 c, 8 c, 1 c, 6 c, 8 c, 8 c, 3 c, 7 c, 8 c, 6 c, 1 c, 0 c, 9 c, 1 c, 5 c, 2 c, 7 c, 3 c, 5 c, 7 c, 9 c, 2 c, 9 c, 7 c, 0 c, 1 c, 3 c, 3 c, 7 c, 
6 c, 2 c, 1 c, 7 c, 7 c, 8 c, 4 c, 2 c, 7 c, 5 c, 2 c, 1 c, 9 c, 2 c, 6 c, 2 c, 3 c, 4 c, 0 c, 1 c, 9 c, 4 c, 2 c, 3 c, 9 c, 9 c, 6 c, 3 c, 9 c, 1 c, 6 c, 8 c, 0 c, 4 c, 4 c, 9 c, 8 c, 3 c, 9 c, 9 c, 3 c, 1 c, 7 c, 3 c, 3 c, 1 c, 2 c, 7 c, 3 c, 1 c, 
3 c, 2 c, 9 c, 2 c, 4 c, 1 c, 8 c, 5 c, 7 c, 0 c, 7 c, 1 c, 4 c, 7 c, 3 c, 4 c, 9 c, 5 c, 6 c, 6 c, 9 c, 1 c, 6 c, 6 c, 7 c, 4 c, 6 c, 8 c, 7 c, 6 c, 3 c, 4 c, 6 c, 6 c, 0 c, 9 c, 1 c, 5 c, 0 c, 3 c, 5 c, 9 c, 1 c, 4 c, 6 c, 7 c, 7 c, 5 c, 0 c, 4 c, 
9 c, 9 c, 5 c, 1 c, 8 c, 6 c, 7 c, 1 c, 4 c, 3 c, 0 c, 2 c, 3 c, 5 c, 2 c, 1 c, 9 c, 6 c, 2 c, 8 c, 8 c, 9 c, 4 c, 8 c, 9 c, 0 c, 1 c, 0 c, 2 c, 4 c, 2 c, 3 c, 3 c, 2 c, 5 c, 1 c, 1 c, 6 c, 9 c, 1 c, 3 c, 6 c, 1 c, 9 c, 6 c, 2 c, 6 c, 6 c, 2 c, 2 c, 
7 c, 3 c, 2 c, 6 c, 7 c, 4 c, 6 c, 0 c, 8 c, 0 c, 0 c, 5 c, 9 c, 1 c, 5 c, 4 c, 7 c, 4 c, 7 c, 1 c, 8 c, 3 c, 0 c, 7 c, 9 c, 8 c, 3 c, 9 c, 2 c, 8 c, 6 c, 8 c, 5 c, 3 c, 5 c, 2 c, 0 c, 6 c, 9 c, 4 c, 6 c, 9 c, 4 c, 4 c, 5 c, 4 c, 0 c, 7 c, 2 c, 4 c, 
7 c, 6 c, 8 c, 4 c, 1 c, 8 c, 2 c, 2 c, 5 c, 2 c, 4 c, 6 c, 7 c, 4 c, 4 c, 1 c, 7 c, 1 c, 6 c, 1 c, 5 c, 1 c, 4 c, 0 c, 3 c, 6 c, 4 c, 2 c, 7 c, 9 c, 8 c, 2 c, 2 c, 7 c, 3 c, 3 c, 4 c, 8 c, 0 c, 5 c, 5 c, 5 c, 5 c, 6 c, 2 c, 1 c, 4 c, 8 c, 1 c, 8 c, 
9 c, 7 c, 1 c, 4 c, 2 c, 6 c, 1 c, 7 c, 9 c, 1 c, 0 c, 3 c, 4 c, 2 c, 5 c, 9 c, 8 c, 6 c, 4 c, 7 c, 2 c, 0 c, 4 c, 5 c, 1 c, 6 c, 8 c, 9 c, 3 c, 9 c, 8 c, 9 c, 4 c, 2 c, 2 c, 1 c, 7 c, 9 c, 8 c, 2 c, 6 c, 0 c, 8 c, 8 c, 0 c, 7 c, 6 c, 8 c, 5 c, 2 c, 
8 c, 7 c, 7 c, 8 c, 3 c, 6 c, 4 c, 6 c, 1 c, 8 c, 2 c, 7 c, 9 c, 9 c, 3 c, 4 c, 6 c, 3 c, 1 c, 3 c, 7 c, 6 c, 7 c, 7 c, 5 c, 4 c, 3 c, 0 c, 7 c, 8 c, 0 c, 9 c, 3 c, 6 c, 3 c, 3 c, 3 c, 3 c, 0 c, 1 c, 8 c, 9 c, 8 c, 2 c, 6 c, 4 c, 2 c, 0 c, 9 c, 0 c, 
1 c, 0 c, 8 c, 4 c, 8 c, 8 c, 0 c, 2 c, 5 c, 2 c, 1 c, 6 c, 7 c, 4 c, 6 c, 7 c, 0 c, 8 c, 8 c, 3 c, 2 c, 1 c, 5 c, 1 c, 2 c, 0 c, 1 c, 8 c, 5 c, 8 c, 8 c, 3 c, 5 c, 4 c, 3 c, 2 c, 2 c, 3 c, 8 c, 1 c, 2 c, 8 c, 7 c, 6 c, 9 c, 5 c, 2 c, 7 c, 8 c, 6 c, 
7 c, 1 c, 3 c, 2 c, 9 c, 6 c, 1 c, 2 c, 4 c, 7 c, 4 c, 7 c, 8 c, 2 c, 4 c, 6 c, 4 c, 5 c, 3 c, 8 c, 6 c, 3 c, 6 c, 9 c, 9 c, 3 c, 0 c, 0 c, 9 c, 0 c, 4 c, 9 c, 3 c, 1 c, 0 c, 3 c, 6 c, 3 c, 6 c, 1 c, 9 c, 7 c, 6 c, 3 c, 8 c, 7 c, 8 c, 0 c, 3 c, 9 c, 
6 c, 2 c, 1 c, 8 c, 4 c, 0 c, 7 c, 3 c, 5 c, 7 c, 2 c, 3 c, 9 c, 9 c, 7 c, 9 c, 4 c, 2 c, 2 c, 3 c, 4 c, 0 c, 6 c, 2 c, 3 c, 5 c, 3 c, 9 c, 3 c, 8 c, 0 c, 8 c, 3 c, 3 c, 9 c, 6 c, 5 c, 1 c, 3 c, 2 c, 7 c, 4 c, 0 c, 8 c, 0 c, 1 c, 1 c, 1 c, 1 c, 6 c, 
6 c, 6 c, 6 c, 2 c, 7 c, 8 c, 9 c, 1 c, 9 c, 8 c, 1 c, 4 c, 8 c, 8 c, 0 c, 8 c, 7 c, 7 c, 9 c, 7 c, 9 c, 4 c, 1 c, 8 c, 7 c, 6 c, 8 c, 7 c, 6 c, 1 c, 4 c, 4 c, 2 c, 3 c, 0 c, 0 c, 3 c, 0 c, 9 c, 8 c, 4 c, 4 c, 9 c, 0 c, 8 c, 5 c, 1 c, 4 c, 1 c, 1 c, 
6 c, 0 c, 6 c, 6 c, 1 c, 8 c, 2 c, 6 c, 2 c, 9 c, 3 c, 6 c, 8 c, 2 c, 8 c, 3 c, 6 c, 7 c, 6 c, 4 c, 7 c, 4 c, 4 c, 7 c, 7 c, 9 c, 2 c, 3 c, 9 c, 1 c, 8 c, 0 c, 3 c, 3 c, 5 c, 1 c, 1 c, 0 c, 9 c, 8 c, 9 c, 0 c, 6 c, 9 c, 7 c, 9 c, 0 c, 7 c, 1 c, 4 c, 
8 c, 5 c, 7 c, 8 c, 6 c, 9 c, 4 c, 4 c, 0 c, 8 c, 9 c, 5 c, 5 c, 2 c, 9 c, 9 c, 0 c, 6 c, 5 c, 3 c, 6 c, 4 c, 0 c, 4 c, 4 c, 7 c, 4 c, 2 c, 5 c, 5 c, 7 c, 6 c, 0 c, 8 c, 3 c, 6 c, 5 c, 9 c, 9 c, 7 c, 6 c, 6 c, 4 c, 5 c, 7 c, 9 c, 5 c, 0 c, 9 c, 6 c, 
6 c, 6 c, 0 c, 2 c, 4 c, 3 c, 9 c, 6 c, 4 c, 0 c, 9 c, 9 c, 0 c, 5 c, 3 c, 8 c, 9 c, 6 c, 0 c, 7 c, 1 c, 2 c, 0 c, 1 c, 9 c, 8 c, 2 c, 1 c, 9 c, 9 c, 7 c, 6 c, 0 c, 4 c, 7 c, 5 c, 9 c, 9 c, 4 c, 9 c, 0 c, 1 c, 9 c, 7 c, 2 c, 3 c, 0 c, 2 c, 9 c, 7 c, 
6 c, 4 c, 9 c, 1 c, 3 c, 9 c, 8 c, 2 c, 6 c, 8 c, 0 c, 0 c, 3 c, 2 c, 9 c, 7 c, 3 c, 1 c, 5 c, 6 c, 0 c, 3 c, 7 c, 1 c, 2 c, 0 c, 0 c, 4 c, 1 c, 3 c, 7 c, 7 c, 9 c, 0 c, 3 c, 7 c, 8 c, 5 c, 5 c, 6 c, 6 c, 0 c, 8 c, 5 c, 0 c, 8 c, 9 c, 2 c, 5 c, 2 c, 
1 c, 6 c, 7 c, 3 c, 0 c, 9 c, 3 c, 9 c, 3 c, 1 c, 9 c, 8 c, 7 c, 2 c, 7 c, 5 c, 0 c, 2 c, 7 c, 5 c, 4 c, 6 c, 8 c, 9 c, 0 c, 6 c, 9 c, 0 c, 3 c, 7 c, 0 c, 7 c, 5 c, 3 c, 9 c, 4 c, 1 c, 3 c, 0 c, 4 c, 2 c, 6 c, 5 c, 2 c, 3 c, 1 c, 5 c, 0 c, 1 c, 1 c, 
9 c, 4 c, 8 c, 0 c, 9 c, 3 c, 7 c, 7 c, 2 c, 4 c, 5 c, 0 c, 4 c, 8 c, 7 c, 9 c, 5 c, 1 c, 5 c, 0 c, 9 c, 5 c, 4 c, 1 c, 0 c, 0 c, 9 c, 2 c, 1 c, 6 c, 4 c, 5 c, 8 c, 6 c, 3 c, 7 c, 5 c, 4 c, 7 c, 1 c, 0 c, 5 c, 9 c, 8 c, 4 c, 3 c, 6 c, 7 c, 9 c, 1 c, 
7 c, 8 c, 6 c, 3 c, 9 c, 1 c, 6 c, 7 c, 0 c, 2 c, 1 c, 1 c, 8 c, 7 c, 4 c, 9 c, 2 c, 4 c, 3 c, 1 c, 9 c, 9 c, 5 c, 7 c, 0 c, 0 c, 6 c, 4 c, 1 c, 9 c, 1 c, 7 c, 9 c, 6 c, 9 c, 7 c, 7 c, 7 c, 5 c, 9 c, 9 c, 0 c, 2 c, 8 c, 3 c, 0 c, 0 c, 6 c, 9 c, 9 c, 
1 c, 5 c, 3 c, 6 c, 8 c, 7 c, 1 c, 3 c, 7 c, 1 c, 1 c, 9 c, 3 c, 6 c, 6 c, 1 c, 4 c, 9 c, 5 c, 2 c, 8 c, 1 c, 1 c, 3 c, 0 c, 5 c, 8 c, 7 c, 6 c, 3 c, 8 c, 0 c, 2 c, 7 c, 8 c, 4 c, 1 c, 0 c, 7 c, 5 c, 4 c, 4 c, 4 c, 9 c, 7 c, 3 c, 3 c, 0 c, 7 c, 8 c, 
4 c, 0 c, 7 c, 8 c, 9 c, 9 c, 2 c, 3 c, 1 c, 1 c, 5 c, 5 c, 3 c, 5 c, 5 c, 6 c, 2 c, 5 c, 6 c, 1 c, 1 c, 4 c, 2 c, 3 c, 2 c, 2 c, 4 c, 2 c, 3 c, 2 c, 5 c, 5 c, 0 c, 3 c, 3 c, 6 c, 8 c, 5 c, 4 c, 4 c, 2 c, 4 c, 8 c, 8 c, 9 c, 1 c, 7 c, 3 c, 5 c, 3 c, 
4 c, 4 c, 8 c, 8 c, 9 c, 9 c, 1 c, 1 c, 5 c, 0 c, 1 c, 4 c, 4 c, 0 c, 6 c, 4 c, 8 c, 0 c, 2 c, 0 c, 3 c, 6 c, 9 c, 0 c, 6 c, 8 c, 0 c, 6 c, 3 c, 9 c, 6 c, 0 c, 6 c, 7 c, 2 c, 3 c, 2 c, 2 c, 1 c, 9 c, 3 c, 2 c, 0 c, 4 c, 1 c, 4 c, 9 c, 5 c, 3 c, 5 c, 
4 c, 1 c, 5 c, 0 c, 3 c, 1 c, 2 c, 8 c, 8 c, 8 c, 0 c, 3 c, 3 c, 9 c, 5 c, 3 c, 6 c, 0 c, 5 c, 3 c, 2 c, 9 c, 9 c, 3 c, 4 c, 0 c, 3 c, 6 c, 8 c, 0 c, 0 c, 6 c, 9 c, 7 c, 7 c, 7 c, 1 c, 0 c, 6 c, 5 c, 0 c, 5 c, 6 c, 6 c, 6 c, 3 c, 1 c, 9 c, 5 c, 4 c, 
8 c, 1 c, 2 c, 3 c, 4 c, 8 c, 8 c, 0 c, 6 c, 7 c, 3 c, 2 c, 1 c, 0 c, 1 c, 4 c, 6 c, 7 c, 3 c, 9 c, 0 c, 5 c, 8 c, 5 c, 6 c, 8 c, 5 c, 5 c, 7 c, 9 c, 3 c, 4 c, 5 c, 8 c, 1 c, 4 c, 0 c, 3 c, 6 c, 2 c, 7 c, 8 c, 2 c, 2 c, 7 c, 0 c, 3 c, 2 c, 8 c, 0 c, 
8 c, 2 c, 6 c, 1 c, 6 c, 5 c, 7 c, 0 c, 7 c, 7 c, 3 c, 9 c, 4 c, 8 c, 3 c, 2 c, 7 c, 5 c, 9 c, 2 c, 2 c, 3 c, 2 c, 8 c, 4 c, 5 c, 9 c, 4 c, 1 c, 7 c, 0 c, 6 c, 5 c, 2 c, 5 c, 0 c, 9 c, 4 c, 5 c, 1 c, 2 c, 3 c, 2 c, 5 c, 2 c, 3 c, 0 c, 6 c, 0 c, 8 c, 
2 c, 2 c, 9 c, 1 c, 8 c, 8 c, 0 c, 2 c, 0 c, 5 c, 8 c, 7 c, 7 c, 7 c, 3 c, 1 c, 9 c, 7 c, 1 c, 9 c, 8 c, 3 c, 9 c, 4 c, 5 c, 0 c, 1 c, 8 c, 0 c, 8 c, 8 c, 8 c, 0 c, 7 c, 2 c, 4 c, 2 c, 9 c, 6 c, 6 c, 1 c, 9 c, 8 c, 0 c, 8 c, 1 c, 1 c, 1 c, 9 c, 7 c, 
7 c, 7 c, 1 c, 5 c, 8 c, 5 c, 4 c, 2 c, 5 c, 0 c, 2 c, 0 c, 1 c, 6 c, 5 c, 4 c, 5 c, 0 c, 9 c, 0 c, 4 c, 1 c, 3 c, 2 c, 4 c, 5 c, 8 c, 0 c, 9 c, 7 c, 8 c, 6 c, 8 c, 8 c, 2 c, 7 c, 7 c, 8 c, 9 c, 4 c, 8 c, 7 c, 2 c, 1 c, 8 c, 5 c, 9 c, 6 c, 1 c, 7 c, 
7 c, 2 c, 1 c, 0 c, 7 c, 8 c, 3 c, 8 c, 4 c, 3 c, 5 c, 0 c, 6 c, 9 c, 1 c, 8 c, 6 c, 1 c, 5 c, 5 c, 4 c, 3 c, 5 c, 6 c, 6 c, 2 c, 8 c, 8 c, 4 c, 0 c, 6 c, 2 c, 2 c, 5 c, 7 c, 4 c, 7 c, 3 c, 6 c, 9 c, 2 c, 2 c, 8 c, 4 c, 5 c, 0 c, 9 c, 5 c, 1 c, 6 c, 
2 c, 0 c, 8 c, 4 c, 9 c, 6 c, 0 c, 3 c, 9 c, 8 c, 0 c, 1 c, 3 c, 4 c, 0 c, 0 c, 1 c, 7 c, 2 c, 3 c, 9 c, 3 c, 0 c, 6 c, 7 c, 1 c, 6 c, 6 c, 6 c, 8 c, 2 c, 3 c, 5 c, 5 c, 5 c, 2 c, 4 c, 5 c, 2 c, 5 c, 2 c, 8 c, 0 c, 4 c, 6 c, 0 c, 9 c, 7 c, 2 c, 2 c, 
5 c, 3 c, 5 c, 0 c, 3 c, 5 c, 3 c, 4 c, 2 c, 2 c, 6 c, 4 c, 7 c, 2 c, 5 c, 2 c, 4 c, 2 c, 5 c, 0 c, 8 c, 7 c, 4 c, 0 c, 5 c, 4 c, 0 c, 7 c, 5 c, 5 c, 9 c, 1 c, 7 c, 8 c, 9 c, 7 c, 8 c, 1 c, 2 c, 6 c, 4 c, 3 c, 3 c, 0 c, 3 c, 3 c, 1 c, 6 c, 9 c, 0 c, 

: get_element ( i j -- start )
  col_offset swap - 
  swap col_nums * + 
  data + c@
;
  
: get_3_result ( j -- partial )
  col_offset swap - 
  result + dup c@ 
  100 *
  swap 1+ dup c@ 
  10 * 
  rot + swap 1+ c@ 
  + 
;
  
: put_3_result ( j -- partial )
  put_offset swap - 
  result + 
  dup 
  rot
  10 /mod
  swap rot c!
  swap 1- dup
  rot 10 /mod
  swap rot c!
  swap 1- c!
;

: pe013
col_nums 0 do
   0 row_nums 0 do
     i j get_element +
   loop 
   i get_3_result + i put_3_result
 loop 

result dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ dup c@ 1 u.r 
1+ c@ 1 u.r cr
;

pe013
bye
