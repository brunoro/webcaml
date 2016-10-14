SOURCES = src/webcaml_bridge.cc src/webcaml.ml src/hello.ml 
RESULT  = hello
PACKS = tsdl result ctypes ctypes.foreign
LDFLAGS = $(shell pkg-config --libs opencv)
CXXFLAGS = $(shell pkg-config --cflags opencv)
CLIBS = opencv_core opencv_highgui c++
OCAMLFLAGS = -opaque

THREADS = yes

all: native-code

run: native-code
	./$(RESULT)

debug: debug-code
	rlwrap ocamldebug $(RESULT) 

-include OCamlMakefile
