(* Lecture 4 - Exercise. 1 *)
module Dict: sig
type key = string
type value = int
let empty key = 0
let add dict key v =
fun key' -> if key=key' then v else dict key'
let find dict key = dict key
end
= struct
type key = string
type value = int
type dictionary = key -> value
let empty key = 0
let add dict key v =
fun key' -> if key=key' then v else dict key'
let find dict key = dict key
end