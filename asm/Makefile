AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: pe test

pe: $(patsubst %.s,%,$(wildcard 0*.s))
test: $(patsubst %.s,%,$(wildcard test*.s))

test_add_digit_strings: test_add_digit_strings.s add_digit_strings.s printbytes.s clearbytes.s
test_compare: test_compare.s compare.s
test_divide_by_10: test_divide_by_10.s divide_by_10.s
test_factorial: test_factorial.s factorial.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s
test_ispalindromic: test_ispalindromic.s ispalindromic.s divide_by_10.s
test_isprime: test_isprime.s isprime.s
test_mul_digit_string: test_mul_digit_string.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s
test_mul_int_string: test_mul_int_string.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s
test_prime_vector: test_prime_vector.s prime_vector.s divide.s

025: 025.s add_digit_strings.s copybytes.s
024: 024.s add_digit_strings.s printbytes.s copybytes.s
023: 023.s divide.s
022: 022.s compare.s
021: 021.s divide.s
020: 020.s factorial.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s
019: 019.s divide.s
016: 016.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s
015: 015.s mul_64to64.s
013: 013.s divide_by_10.s
010: 010.s prime_vector.s divide.s
007: 007.s isprime.s
005: 005.s isprime.s
004: 004.s ispalindromic.s divide_by_10.s
003: 003.s isprime.s

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f 0[012]? *.o test_isprime test_divide_by_10 test_ispalindromic test_mul_digit_string test_add_digit_strings test_mul_int_string test_factorial test_compare test_prime_vector
