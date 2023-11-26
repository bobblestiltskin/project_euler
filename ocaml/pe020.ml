let ascii_offset = 48 ;; 

let rec factorial num =
   if Z.equal num Z.one then
     Z.one
   else
     let prednum = Z.pred num in
       let fact = factorial prednum in
         let prod = Z.mul num fact in
           prod

let rec sum_string s sum index =
  if index = 0 then
    sum + int_of_char s.[0] - ascii_offset
  else
    sum_string s (sum + int_of_char s.[index] - ascii_offset) (index - 1) ;;
    
let maxv = Z.of_int 100 ;;
let fval = factorial maxv ;;
let f100 = Z.to_string fval ;;

Printf.printf "%d\n" (sum_string f100 0 (String.length f100 - 1)) ;;
