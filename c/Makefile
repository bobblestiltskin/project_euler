CCOPTS  := -Wall -Werror -g
CLIBS   := -lm

all: 001 002 003 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019 020 021 022 023 024 025

test_factorial: test_factorial.c factorial.c mul_int_string.c mul_digit_string.c add_digit_strings.c 
test_mul_int_string: test_mul_int_string.c mul_int_string.c mul_digit_string.c add_digit_strings.c
test_add_digit_strings: test_add_digit_strings.c add_digit_strings.c 
test_mul_digit_string: test_mul_digit_string.c mul_digit_string.c

%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f *.o 0[012]? test_factorial test_add_digit_strings test_mul_digit_string test_mul_int_string

