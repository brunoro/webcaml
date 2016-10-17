open Ctypes
open Foreign
open Tsdl
open Result

type capture = unit ptr
let capture = ptr void
let capture_opt = ptr_opt void

let some_to_result = function
  | Some p -> Ok p
  | None -> Error (`Msg (Sdl.get_error ()))

let map_result f v = 
  match v with
  | Ok o -> Ok (f o)
  | Error e -> Error e

let create_capture index = 
  index
  |> (foreign "createCapture" (int @-> returning capture_opt))
  |> some_to_result

let destroy_capture = 
  foreign "destroyCapture" (capture @-> returning void)

let surface_of_ptr p = 
  p |> raw_address_of_ptr |> Sdl.unsafe_surface_of_ptr

let query_surface cap = 
  cap 
  |> (foreign "querySurface" (capture @-> returning (ptr_opt void))) 
  |> some_to_result
  |> (map_result surface_of_ptr)
