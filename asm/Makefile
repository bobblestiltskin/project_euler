AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: $(patsubst %.s,%,$(wildcard 0*.s))

test_isprime: test_isprime.s isprime.s
test_last_digit: test_last_digit.s last_digit.s
test_ispalindromic: test_ispalindromic.s ispalindromic.s last_digit.s

005: 005.s isprime.s
004: 004.s ispalindromic.s last_digit.s
003: 003.s isprime.s

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f 0[012]? *.o test_isprime test_last_digit test_ispalindromic
