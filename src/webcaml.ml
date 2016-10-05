open Ctypes

type capture = unit ptr
let capture : capture typ = ptr void

type mat = unit ptr
let mat : mat typ = ptr void

open Foreign

let open_camera = foreign "cvCreateCameraCapture" (int @-> returning capture)
let query_frame = foreign "cvQueryFrame" (capture @-> returning mat)
let show_image = foreign "cvShowImage" (string @-> mat @-> returning void)
let wait_key = foreign "cvWaitKey" (int @-> returning int)
let release_capture = foreign "cvReleaseCapture" (ptr capture @-> returning void)
let destroy_window = foreign "cvDestroyWindow" (string @-> returning void)
