SOURCES = src/webcaml.ml src/hello.ml 
RESULT  = hello
PACKS = ctypes ctypes.foreign
CLIBS = opencv_core opencv_highgui
LIBDIRS = "/usr/local/opt/opencv/lib"
THREADS = yes

all: native-code

run: native-code
	./$(RESULT)

debug: debug-code
	rlwrap ocamldebug $(RESULT) 

-include OCamlMakefile
