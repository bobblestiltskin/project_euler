open Core.Std
open Int64

let million = 1000000L ;;

let even x = rem x 2L = zero ;;

let rec collatz c n =
  if n = one then
    c
  else 
    if even n then
      collatz (c + one) (n / 2L)
    else
      collatz (c + one) ((3L * n) + one) ;;
     
let rec pe014 maxv maxi i m =
  if i < m then
    let next = (collatz zero i) in
      if next > maxv then
        pe014 next i (i + one) m
      else
        pe014 maxv maxi (i + one) m
  else
    printf "%Ld\n" maxi ;;

pe014 zero zero one million ;;
