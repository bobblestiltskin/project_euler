CC      := /usr/bin/g++
CPPOPTS  := -g -Wall -Werror

all: $(patsubst %.cpp,%,$(wildcard 0*.cpp))

020: factorial.cpp numstring.cpp
025: numstring.cpp

test_factorial: test_factorial.cpp factorial.cpp numstring.cpp
test_add_digit_strings: test_add_digit_strings.cpp numstring.cpp
test_mul_int_string: test_mul_int_string.cpp numstring.cpp
test_mul_digit_string: test_mul_digit_string.cpp numstring.cpp

%: %.cpp
	$(CC) $(CPPOPTS) -o $@ $^

clean:
	/bin/rm -f *.o 0[012]? test_factorial test_add_digit_strings test_mul_digit_string test_mul_int_string
