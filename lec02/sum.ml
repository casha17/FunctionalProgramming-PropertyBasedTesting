let rec sum l = match l with 
| [] -> 0
| elem::elems -> elem + (sum elems);;

let mylist = 1::2::3::4::[];;
sum(mylist);;
print_int(sum(mylist));;

(* æ
*
*f,prt 
*)