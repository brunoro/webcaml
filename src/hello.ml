open Webcaml
open Tsdl
open Result
open Printf
open Ctypes

let main () = 
  let cap = open_camera 0 in
  let surface = query_frame cap in
  let size = frame_size frame in
  match Sdl.init Sdl.Init.video with
  | Error (`Msg e) -> Sdl.log "Init error: %s" e; exit 1
  | Ok () ->
      match Sdl.create_window_and_renderer ~w:640 ~h:480 "hello" Sdl.Window.shown with
      | Error (`Msg e) -> Sdl.log "Create window error: %s" e; exit 1
      | Ok w ->
          showloop w cap frame;
          Sdl.destroy_window w;
          Sdl.quit ();
          exit 0

let () = main ()

