AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: $(patsubst %.s,%,$(wildcard 0*.s))

003: 003.s isprime.s

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f 0[012]? *.o test_isprime
