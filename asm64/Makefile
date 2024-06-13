AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g

#all: pe
all: pe test
#all: test pe

pe: $(patsubst %.s,%,$(wildcard pe0*.s))
test: $(patsubst %.s,%,$(wildcard test*.s))

test_add_digit_strings: test_add_digit_strings.s add_digit_strings.s printbytes.s clearbytes.s regs.s
test_compare: test_compare.s compare.s regs.s
test_divide: test_divide.s divide.s regs.s
test_divide_by_10: test_divide_by_10.s divide_by_10.s regs.s
test_factorial: test_factorial.s factorial.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s mul_tens_string.s regs.s
test_ispalindromic: test_ispalindromic.s ispalindromic.s divide_by_10.s regs.s
test_isprime: test_isprime.s isprime.s divide.s regs.s
test_mul_digit_string: test_mul_digit_string.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s regs.s
test_mul_int_string: test_mul_int_string.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s mul_tens_string.s regs.s
test_prime_vector: test_prime_vector.s prime_vector.s divide.s regs.s
test_multiply_by_10: test_multiply_by_10.s mul_tens_string.s copybytes.s clearbytes.s printbytes.s regs.s

pe025: pe025.s add_digit_strings.s copybytes.s regs.s
pe024: pe024.s add_digit_strings.s printbytes.s copybytes.s regs.s
pe023: pe023.s divide.s regs.s
pe022: pe022.s compare.s regs.s
pe021: pe021.s divide.s regs.s
pe020: pe020.s factorial.s mul_int_string.s add_digit_strings.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s mul_tens_string.s regs.s
pe019: pe019.s divide.s regs.s
pe016: pe016.s mul_digit_string.s divide_by_10.s copybytes.s clearbytes.s printbytes.s regs.s
pe013: pe013.s divide_by_10.s regs.s
pe012: pe012.s divide.s regs.s
pe010: pe010.s prime_vector.s divide.s regs.s
pe007: pe007.s prime_vector.s divide.s regs.s
pe004: pe004.s ispalindromic.s divide_by_10.s regs.s

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f pe0[012]? *.o test_isprime test_divide_by_10 test_ispalindromic test_mul_digit_string test_add_digit_strings test_mul_int_string test_factorial test_compare test_prime_vector test_long_divide test_divide test_long_multiply test_multiply_by_10
