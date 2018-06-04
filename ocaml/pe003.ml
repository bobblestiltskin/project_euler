open Core

let divisible x y  = 
  Int64.(rem x y = zero) ;;

let rec pe003 n i =
  let open Int64 in
    if n = one then
      printf "%Lu\n" (i - of_int 2)
    else
      if (divisible n i) then
        pe003 (n / i) (i + of_int 2)
      else
        pe003 n (i + of_int 2) ;;

pe003 600851475143L 3L ;;
