GHC := /usr/bin/ghc
GHCOPTS := -v

%:	%.hs
	$(GHC) $(GHCOPTS) $?
	
clean:
	rm -f 0?? *.hi *.o
