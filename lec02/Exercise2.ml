open QCheck;;


(* 1 -- Write a recursive function that dertmines the most significant bit *)
let msb_bad x = String.length(string_of_int(x lsr 0));;

let rec msb n = 
if n = 0
then 0
else 1 + msb(n lsr 1 );;

(*  ******************************************************************************* *)

(* 2 -- Implement fst and snd with patch matching *)

(** TODO *)

(*  ******************************************************************************* *)
()
(* 3 -- Sum function  *)

let rec sum l = match l with 
| [] -> 0
| elem::elems -> elem + (sum elems);;

(* 3 -- Member function  *)


let rec  member l x = match l  with 
| [] -> false
| elem::elems -> if (elem == x) then true else (member elems x);;


(*  ******************************************************************************* *)


(* 4 -- Write QCheck test for the sum fucntion *)

let sumTest = Test.make ~name: "sumTest" (pair (list int) (list int)) (fun (xs,ys) -> sum (xs @ ys ) = (sum xs) + (sum ys));;

(*  ******************************************************************************* *)

(* 5a -- Recursive function that merges two lists*)


let rec merge list1 list2 =
   match list1, list2 with
   | [], _ -> list2
   | _, [] -> list1
   | list1elem :: list1elems, list2elem :: list2elems ->
       if list1elem < list2elem then list1elem :: merge list1elems list2 else list2elem :: merge list1 list2elems;;


(* 5b -- Qcheck the merge  *)

let mytest = Test.make ~count:1000 (pair (list int) (list int)) (fun (xs,ys) -> sum(merge (List.sort compare xs) (List.sort compare ys)) == sum(xs @ ys) )



(*  ******************************************************************************* *)

(* 6 -- Which of the three properties   *)

let intTest1 = Test.make  int (fun (x) -> Int64.to_int (Int64.of_int x) == x)
(*let intTest2 = Test.make  int (fun (x) -> Int32.to_int (Int32.of_int x) == x) *)

let _ =
  begin
    Printf.printf "\nRunning property-based tests:\n-----------------------------\n\n";
    QCheck_runner.run_tests ~verbose:true [
      mytest;
      intTest1;
    ]
  end