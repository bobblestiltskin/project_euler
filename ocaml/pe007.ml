open Core.Std

let maxi = 10001 ;;

let divisible x y  = 
  x mod y = 0 ;;

let rec prime_test n maxv =
  if (n * n) > maxv then
    true
  else
    if divisible maxv n then
      false
    else
      prime_test (n+2) maxv ;;

let is_prime n =
  match n with
  | 0           -> false
  | 1           -> false
  | 2           -> true
  | _           -> if divisible n 2 then false else prime_test 3 n ;;

let rec pe007 i max count =
  if count = max then
    printf "%d\n" (i - 1)
  else
    if is_prime i then
      pe007 (i + 1) max (count + 1)
    else
      pe007 (i + 1) max count ;;

pe007 1 maxi 0 ;;
