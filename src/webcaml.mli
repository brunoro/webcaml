type capture = unit Ctypes.ptr
val capture : capture Ctypes_static.typ

type mat = unit Ctypes.ptr
val mat : mat Ctypes_static.typ

val open_camera : int -> capture
val create_frame : unit -> capture
val query_frame : capture -> mat -> unit
val show_image : string -> mat -> unit
val wait_key : int -> int
