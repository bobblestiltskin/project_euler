ERL := /usr/bin/erl
ERLOPTS := -noshell -s
SSOPTS := start -s init stop
ERLC := /usr/bin/erlc
ERLCOPTS := -v

all: pe001 pe002 pe003

%: %.beam
	$(ERL) $(ERLOPTS) $@ $(SSOPTS)

%.beam:	%.erl
	$(ERLC) $(ERLCOPTS) $?
	
clean:
	rm -f pe???.beam erl_crash.dump
