mlfiles     := $(shell echo *.ml)
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
	corebuild $@

clean:
	rm -rf *.native _build
