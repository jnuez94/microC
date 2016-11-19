ocaml:
	ocamllex scanner.mll
	ocamlyacc -v parser.mly
	ocamlc -c ast.ml
	ocamlc -c parser.mli
	ocamlc -c scanner.ml
	ocamlc -c parser.ml
	ocamlc -c semant.ml
	ocamlc -c microc.ml
	ocamlc -o microc parser.cmo scanner.cmo ast.cmo semant.cmo microc.cmo

clean:
	ocamlbuild -clean
	rm -rf scanner.ml parser.ml parser.mli
	rm -rf *.cmx *.cmi *.cmo *.cmx *.o
	rm -rf microc *.pd

build:
	ocamlbuild -use-ocamlfind -pkgs llvm,llvm.analysis -cflags -w,+a-4 microc.native
