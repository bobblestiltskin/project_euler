open Core.Std

let divisible x y  = x mod y = 0 ;;

let rec pe003 n i =
  match n with
  | 1 -> printf "%d\n" (i-2)
  | _ -> if divisible n i then
           pe003 (n/i) (i+2)
         else
           pe003 n (i+2) ;;

pe003 600851475143 3
