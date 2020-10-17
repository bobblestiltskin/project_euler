CC      := /usr/bin/g++
CPPOPTS  := -g -Wall -Werror

all: $(patsubst %.cpp,%,$(wildcard pe0*.cpp))

test_factorial: test_factorial.cpp factorial.cpp numstring.cpp
test_add_digit_strings: test_add_digit_strings.cpp numstring.cpp
test_mul_int_string: test_mul_int_string.cpp numstring.cpp
test_mul_digit_string: test_mul_digit_string.cpp numstring.cpp

pe020: pe020.cpp factorial.cpp numstring.cpp
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

pe025: pe025.cpp numstring.cpp
	$(CC) $(CCOPTS) -o $@ $^

%: %.cpp
	$(CC) $(CPPOPTS) -o $@ $^

clean:
	/bin/rm -f *.o pe0[012]? test_factorial test_add_digit_strings test_mul_digit_string test_mul_int_string
