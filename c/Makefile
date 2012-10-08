CCOPTS  := -Wall -Werror -g
CLIBS   := -lm

#test_add_digit_strings.c  test_factorial.c  test_mul_digit_string.c  test_mul_int_string.c

test_factorial: test_factorial.c factorial.c mul_int_string.c mul_digit_string.c add_digit_strings.c 
test_mul_int_string: test_mul_int_string.c 
test_add_digit_strings: test_add_digit_strings.c add_digit_strings.c 
test_mul_digit_string: test_mul_digit_string.c mul_digit_string.c

%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)
