open Int64

let million = 1000000L ;;

let even x = rem x 2L = zero ;;

let rec collatz c n =
  if n = one then
    c
  else 
    if even n then
      collatz (add c one) (div n 2L)
    else
      collatz (add c one) (add (mul 3L n) one) ;;
     
let rec pe014 maxv maxi i m =
  if i < m then
    let next = (collatz zero i) in
      if next > maxv then
        pe014 next i (add i one) m
      else
        pe014 maxv maxi (add i one) m
  else
    Printf.printf "%Ld\n" maxi ;;

let main () =
  pe014 zero zero one million ;;

let () = main ()
