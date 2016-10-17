open Webcaml
open Tsdl
open Result
open Printf
open Ctypes

let should_exit () = 
  let e = Sdl.Event.create () in
  let rec should_exit_loop e =
    if Sdl.poll_event (Some e)
    then match Sdl.Event.(enum (get e typ)) with
    | `Quit -> true
    | _ -> should_exit_loop e
    else false in
  should_exit_loop e


let rec showloop renderer capture =
  match query_surface capture with
  | Error (`Msg e) -> Sdl.log "Error grabbing frame: %s" e
  | Ok surface ->
    (match Sdl.create_texture_from_surface renderer surface with
    | Ok texture ->
      ignore (Sdl.render_copy renderer texture);
      Sdl.render_present renderer
    | Error (`Msg e) ->
      Sdl.log "Texture copy error: %s" e);
    if not (should_exit ())
    then showloop renderer capture

let main () =
  match create_capture 0 with
  | Error (`Msg e) -> Sdl.log "Error initializing capture: %s" e
  | Ok capture ->
    match query_surface capture with
    | Error (`Msg e) -> Sdl.log "Error grabbing frame: %s" e
    | Ok surface ->
      let (w, h)  = Sdl.get_surface_size surface in
      Sdl.log "Got first frame with size (%d, %d)" w h;
      match Sdl.init Sdl.Init.video with
      | Error (`Msg e) -> Sdl.log "Init error: %s" e; exit 1
      | Ok () ->
        match Sdl.create_window_and_renderer ~w:w ~h:h Sdl.Window.shown with
        | Error (`Msg e) -> Sdl.log "Create window error: %s" e; exit 1
        | Ok (window, renderer) ->
          showloop renderer capture;
          Sdl.destroy_window window;
          Sdl.quit ();
          exit 0

let () = main ()

