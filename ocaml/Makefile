mlfiles     := $(shell echo *.ml)
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
	corebuild -tag use_nums $@

clean:
	rm -rf *.native _build
