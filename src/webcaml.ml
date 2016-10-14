open Ctypes
open Unsigned

type capture = unit ptr
let capture : capture typ = ptr void

type surface = unit ptr
let surface : surface typ = ptr void

open Foreign

let create_capture = foreign "createCapture" (int @-> returning capture)
let query_frame = foreign "queryFrame" (capture @-> returning surface)
