open Webcaml
open Printf
open Ctypes

let rec showloop cap frame =
  query_frame cap frame;
  for x = 0 to cols frame do
    for y = 0 to rows frame do
      let c = get_pixel frame x y in
      set_pixel frame x y { r = c.g; g = c.b; b = c.r };
    done
  done;
 
  show_image frame;
  if wait_key 30 < 0
  then showloop cap frame

let () =
  let cap = open_camera 0 in
  let frame = create_frame () in
  showloop cap frame;

