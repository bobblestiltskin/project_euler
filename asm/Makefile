AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: 001 002

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)
