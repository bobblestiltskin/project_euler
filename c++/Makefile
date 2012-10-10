CC      := /usr/bin/g++
CPPOPTS  := -g -Wall -Werror -std=c++11

test_factorial: test_factorial.cpp factorial.cpp mul_int_string.cpp mul_digit_string.cpp add_digit_strings.cpp 
test_mul_int_string: test_mul_int_string.cpp mul_int_string.cpp mul_digit_string.cpp add_digit_strings.cpp
test_add_digit_strings: test_add_digit_strings.cpp add_digit_strings.cpp 
test_mul_digit_string: test_mul_digit_string.cpp mul_digit_string.cpp

%: %.cpp
	$(CC) $(CPPOPTS) -o $@ $^
clean:
	/bin/rm -f *.o 0[012]? test_factorial test_add_digit_strings test_mul_digit_string test_mul_int_string
