open Int64

let maxi = 2_000_000L ;;

let divisible x y  = 
  Int64.(rem x y = zero) ;;

let rec prime_test n maxv =
  if (mul n n) > maxv then
    true
  else
    if (divisible maxv n) then
      false
    else
      prime_test (add n 2L) maxv ;;

let is_prime n =
  match n with
  | 0L   -> false
  | 1L   -> false
  | 2L   -> true
  | _    -> if divisible n 2L then false else prime_test 3L n ;;

let rec pe010 isum count =
  if count > maxi then
    Printf.printf "%Ld\n" isum
  else
    if is_prime count then
      pe010 (add isum count) (add count 1L) 
    else
      pe010 isum (succ count) ;;

let main () =
  pe010 0L 1L ;;

let () = main ()
