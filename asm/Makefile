AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

#all: 001 002 003
all: $(patsubst %.s,%,$(wildcard 0*.s))

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	/bin/rm -f 0[012]?
