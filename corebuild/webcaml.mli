type capture = unit Ctypes.ptr
val capture : capture Ctypes_static.typ

type mat = unit Ctypes.ptr
val mat : mat Ctypes_static.typ

val open_camera : int -> capture
val query_frame : capture -> mat
val show_image : string -> mat -> unit
val wait_key : int -> int
val release_capture : capture Ctypes_static.ptr -> unit
val destroy_window : string -> unit
