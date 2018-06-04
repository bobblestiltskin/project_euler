open Core

let imax = 500 ;;

let divisible x y  = 
  x mod y = 0 ;;

let rec sqrt_factors i n nf =
  if i * i = n then
    (2 * nf) + 1
  else
    if i * i > n then
      2 * nf
    else
      if divisible n i then
        sqrt_factors (i + 1) n (nf + 1)
      else
        sqrt_factors (i + 1) n nf ;;

let rec pe012 max len i total =
  if len > max then
    printf "%d\n" total
  else
    let next = total + i in 
    let result = sqrt_factors 1 next 0 in
    pe012 max result (i + 1) next ;;

pe012 imax 0 0 0 ;;
