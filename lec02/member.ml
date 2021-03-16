let rec  member l x = match l  with 
| [] -> false
| elem::elems -> if (elem == x) then true else (member elems x);;

let mylist = 1::2::3::4::[];;
member mylist 2;;