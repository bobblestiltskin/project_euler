ERL := /usr/bin/erl
ERLOPTS := -noshell -s
SSOPTS := start -s init stop
ERLC := /usr/bin/erlc
ERLCOPTS := -v

all: $(patsubst %.erl,%,$(wildcard pe0*.erl))

%: %.beam
	$(ERL) $(ERLOPTS) $@ $(SSOPTS)

%.beam:	%.erl
	$(ERLC) $(ERLCOPTS) $?
	
clean:
	rm -f pe???.beam erl_crash.dump
