open Big_int

let ascii_offset = 48 ;; 

let rec factorial num =
   if eq_big_int num unit_big_int then
     unit_big_int
   else
     let prednum = pred_big_int num in 
       let fact = factorial prednum in
         let prod = mult_big_int num fact in
           prod

let rec sum_string s sum index =
  if index = 0 then
    sum + int_of_char s.[0] - ascii_offset
  else
    sum_string s (sum + int_of_char s.[index] - ascii_offset) (index - 1) ;;
    
let maxv = big_int_of_int 100 ;;
let fval = factorial maxv ;;
let f100 = string_of_big_int fval ;;

Printf.printf "%d\n" (sum_string f100 0 (String.length f100 - 1)) ;;
