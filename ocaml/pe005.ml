let maxv = 20 ;;

let divisible x y  = 
  x mod y = 0 ;;

let rec max_base_m_lt_n m last n =
  if m * last > n then
    last
  else
    max_base_m_lt_n m (m * last) n ;;

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

let rec pe005 i max lcm =
  if i > max then
    Printf.printf "%d\n" lcm
  else
    if is_prime i then
      pe005 (i + 1) max (lcm * (max_base_m_lt_n i 1 max))
    else
      pe005 (i + 1) max lcm ;;

let main () =
  pe005 1 maxv 1 ;;

let () = main ()
