open Core.Std

let ascii_offset = 48 ;; 

let rec factorial num =
  if num = 1 then
    Big_int.unit_big_int
  else
    Big_int.mult_int_big_int num (factorial(num - 1)) ;;

let rec sum_string s sum index =
  if index = 0 then
    sum + int_of_char s.[0] - ascii_offset
  else
    sum_string s (sum + int_of_char s.[index] - ascii_offset) (index - 1) ;;
    
  
let f100 = Big_int.string_of_big_int (factorial 100) ;;

printf "%d\n" (sum_string f100 0 (String.length f100 - 1)) ;;
