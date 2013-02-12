#! /usr/bin/gforth

include cdump.fs
include add_digit_strings.fs

create str1 8 c, 7 c, 6 c, 5 c, 4 c, 3 c, 2 c, 1 c,
8 constant len1
create str2 3 c, 6 c, 5 c, 7 c, 1 c, 5 c,
6 constant len2
create str3 1 c, 2 c, 3 c, 4 c, 5 c, 6 c,
6 constant len3

: test_add_strings ( -- )
    str1 len1 str2 len2 add_strings
    str1 8 cdump
    str3 len3 str1 len1 add_strings
    str1 8 cdump
    str2 len2 str3 len3 add_strings 
    str3 6 cdump
;

test_add_strings
bye
