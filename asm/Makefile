AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: pe test

pe: $(patsubst %.s,%,$(wildcard 0*.s))
test: $(patsubst %.s,%,$(wildcard test*.s))

test_isprime: test_isprime.s isprime.s
test_divide_by_10: test_divide_by_10.s divide_by_10.s
test_ispalindromic: test_ispalindromic.s ispalindromic.s divide_by_10.s

005: 005.s isprime.s
004: 004.s ispalindromic.s divide_by_10.s
003: 003.s isprime.s

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f 0[012]? *.o test_isprime test_divide_by_10 test_ispalindromic
