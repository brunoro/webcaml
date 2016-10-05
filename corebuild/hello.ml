open Webcaml
open Printf
open Ctypes

let rec showloop window cap =
  let frame = query_frame cap in
  show_image window frame;
  if wait_key 30 < 0
  then showloop window cap

let () =
  let window = "img" in
  let cap = open_camera 0 in
  showloop window cap;

