open Ctypes

type capture = unit ptr
let capture : capture typ = ptr void

type mat = unit ptr
let mat : mat typ = ptr void

open Foreign

let open_camera = foreign "createCapture" (int @-> returning capture)
let create_frame = foreign "createFrame" (void @-> returning mat)
let query_frame = foreign "queryFrame" (capture @-> mat @-> returning void)
let show_image = foreign "showImage" (string @-> mat @-> returning void)
let wait_key = foreign "waitKey" (int @-> returning int)
