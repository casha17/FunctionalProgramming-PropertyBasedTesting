let msb_bad x = String.length(string_of_int(x lsr 0));;
print_int(msb_bad(0001000));;

let rec msb n = 
if n = 0
then 0
else 1 + msb(n lsr 1 );;
print_int(msb(00101));;