FILES:=$(patsubst %.hs,%,$(wildcard pe0*.hs))
GHC := /usr/bin/ghc
#GHCOPTS := -v

%:	%.hs
	$(GHC) $(GHCOPTS) $?

all: $(FILES)
	
clean:
	rm -f $(FILES) *.hi *.o
