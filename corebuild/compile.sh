#!/bin/bash
corebuild\
  -pkg ctypes.foreign \
  -lflags -ccopt,-L/usr/local/opt/opencv/lib \
  -lflags -cclib,-lopencv_core \
  -lflags -cclib,-lopencv_highgui \
  -lflags -cclib,-lopencv_video \
  -lflags -cclib,-lopencv_imgproc \
  hello.native

#-lflags -ccopt,-I/usr/local/opt/opencv/include \
