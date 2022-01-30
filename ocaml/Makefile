mlfiles     := $(shell echo *.ml)
nativefiles := $(mlfiles:.ml=.native)

all: $(nativefiles)

%.native: %.ml
#	corebuild -r -use-ocamlfind -tag use_nums -tag use_str $@
#	corebuild -r -verbose 1 -tag use_nums -tag use_str $@
	ocamlbuild -r -verbose 1 $@
#	ocamlbuild $@

clean:
	rm -rf *.native _build
