mlfiles     := pe020.ml pe025.ml
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
	ocamlbuild -r -verbose 1 $@

clean:
	rm -rf *.native _build
