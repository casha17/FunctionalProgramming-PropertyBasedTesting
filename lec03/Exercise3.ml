
open QCheck;;


(* 1 -- Write a function   size : aexp -> int that computes the size of an arithmetic expression. *)

type aexp = 
| X
| Lit of int
| Plus of aexp * aexp
| Times of aexp * aexp

let tree = Plus (Lit 1, Times (Plus( Lit 1 , Lit 1), Plus(Plus(Lit 1 , Lit 1 ) , Lit 1)))

type 'a option = 
| None
| Some of 'a

let first_elem l = match l with
| [] -> None
| e::es -> Some e


let rec size  ae = match ae with
  | X -> 1 
  | Lit i -> 1 
  | Plus (ae0, ae1) ->
    let v0 = size ae0 in
    let v1 = size ae1 in
    if v0 > v1 then 1 + v0 else 1 + v1
  | Times (ae0, ae1) ->
    let v0 = size ae0 in
    let v1 = size ae1 in
    if v0 > v1 then 1 + v0 else 1 + v1


let rec interpret xval ae = match ae with
  | X -> xval
  | Lit i -> i
  | Plus (ae0, ae1) ->
    let v0 = interpret xval ae0 in
    let v1 = interpret xval ae1 in
    v0 + v1
  | Times (ae0, ae1) ->
    let v0 = interpret xval ae0 in
    let v1 = interpret xval ae1 in
    v0 * v1


