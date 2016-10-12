open Ctypes
open Unsigned

type capture = unit ptr
let capture : capture typ = ptr void

type mat = unit ptr
let mat : mat typ = ptr void

type color = { r : uchar; g : uchar; b : uchar }

open Foreign

let open_camera = foreign "createCapture" (int @-> returning capture)
let create_frame = foreign "createFrame" (void @-> returning mat)
let query_frame = foreign "queryFrame" (capture @-> mat @-> returning void)
let show_image = foreign "showImage" (mat @-> returning void)
let wait_key = foreign "waitKey" (int @-> returning int)

let get_pixel_r = foreign "getPixelR" (mat @-> int @-> int @-> returning uchar)
let get_pixel_g = foreign "getPixelG" (mat @-> int @-> int @-> returning uchar)
let get_pixel_b = foreign "getPixelB" (mat @-> int @-> int @-> returning uchar)

let set_pixel_r = foreign "setPixelR" (mat @-> int @-> int @-> uchar @-> returning void)
let set_pixel_g = foreign "setPixelG" (mat @-> int @-> int @-> uchar @-> returning void)
let set_pixel_b = foreign "setPixelB" (mat @-> int @-> int @-> uchar @-> returning void)

let rows = foreign "rows" (mat @-> returning int)
let cols = foreign "cols" (mat @-> returning int)

let zero = foreign "zero" (void @-> returning uchar)

let get_pixel mat x y =
  { r = get_pixel_r mat x y;
    g = get_pixel_g mat x y;
    b = get_pixel_b mat x y }

let set_pixel mat x y c =
  set_pixel_r mat x y c.r;
  set_pixel_g mat x y c.g;
  set_pixel_b mat x y c.b

let print_color c =
  let to_int = Unsigned.UChar.to_int in
  Printf.printf "(%d %d %d) " (to_int c.r) (to_int c.g) (to_int c.b)
