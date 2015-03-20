mlfiles     := $(shell echo *.ml)
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
	corebuild -tag use_nums -tag use_str $@

clean:
	rm -rf *.native _build
