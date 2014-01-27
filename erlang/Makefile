ERLC := /usr/bin/erlc
ERLCOPTS := -v

all: pe001.beam

%.beam:	%.erl
	$(ERLC) $(ERLCOPTS) $?
	
clean:
	rm -f pe???.beam
