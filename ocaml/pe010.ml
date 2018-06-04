open Core
open Int64

let maxi = 2_000_000L ;;

let divisible x y  = 
  Int64.(rem x y = zero) ;;

let rec prime_test n maxv =
  if (n * n) > maxv then
    true
  else
    if (divisible maxv n) then
      false
    else
      prime_test (n + of_int 2) maxv ;;

let is_prime n =
  match n with
  | 0L   -> false
  | 1L   -> false
  | 2L   -> true
  | _    -> if divisible n 2L then false else prime_test 3L n ;;

let rec pe010 isum count =
  if count > maxi then
    printf "%Ld\n" isum
  else
    if is_prime count then
      pe010 Int64.(isum + count) Int64.(succ count) 
    else
      pe010 isum (succ count) ;;

pe010 0L 1L ;;
