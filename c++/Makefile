CC      := /usr/bin/g++
CPPOPTS  := -g -Wall -Werror -std=c++11

all: 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025

020: factorial.cpp mul_int_string.cpp mul_digit_string.cpp add_digit_strings.cpp
025: add_digit_strings.cpp

test_factorial: test_factorial.cpp factorial.cpp mul_int_string.cpp mul_digit_string.cpp add_digit_strings.cpp 
test_mul_int_string: test_mul_int_string.cpp mul_int_string.cpp mul_digit_string.cpp add_digit_strings.cpp
test_add_digit_strings: test_add_digit_strings.cpp add_digit_strings.cpp 
test_mul_digit_string: test_mul_digit_string.cpp mul_digit_string.cpp

%: %.cpp
	$(CC) $(CPPOPTS) -o $@ $^

clean:
	/bin/rm -f *.o 0[012]? test_factorial test_add_digit_strings test_mul_digit_string test_mul_int_string
