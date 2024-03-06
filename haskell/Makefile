FILES:=pe001 pe002
GHC := /usr/bin/ghc
#GHCOPTS := -v

%:	%.hs
	$(GHC) $(GHCOPTS) $?

all: $(FILES)
	
clean:
	rm -f $(FILES) *.hi *.o
