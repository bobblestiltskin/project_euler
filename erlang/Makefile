ERL := /usr/bin/erl
ERLC := /usr/bin/erlc
ERLCOPTS := -v

all: pe001

pe001: pe001.beam
	$(ERL) -noshell -s $@ start -s init stop

%.beam:	%.erl
	$(ERLC) $(ERLCOPTS) $?
	
clean:
	rm -f pe???.beam
