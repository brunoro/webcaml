open Webcaml
open Printf
open Ctypes

let rec showloop window cap frame =
  query_frame cap frame;
  show_image window frame;
  if wait_key 30 < 0
  then showloop window cap frame

let () =
  let window = "img" in
  let cap = open_camera 0 in
  let frame = create_frame () in
  showloop window cap frame;

