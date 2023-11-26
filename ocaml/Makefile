mlfiles     := pe020.ml pe025.ml
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
	ocamlopt -o $@ -I `ocamlfind query zarith` zarith.cmxa $^

clean:
	rm -rf *.native _build
