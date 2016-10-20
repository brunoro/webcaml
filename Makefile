SOURCES = src/webcaml_bridge.cc src/webcaml.ml src/hello.ml 
RESULT  = hello
PACKS = batteries tsdl result ctypes ctypes.foreign
CXXFLAGS = $(shell pkg-config --cflags opencv sdl2)
CLIBS = opencv_core opencv_highgui c++  ## tsdl should already guarantee that sdl2 is linked
OCAMLFLAGS = -opaque

THREADS = yes

all: native-code

run: native-code
	./$(RESULT)

-include OCamlMakefile
