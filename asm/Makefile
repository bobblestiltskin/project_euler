AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

%: %.s
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)
