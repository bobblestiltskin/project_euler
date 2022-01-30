let maxv = 100 ;;

let ap_sum x y =
  ((x + y) * ((y - x) + 1)) / 2 ;;

let sq_sum x y =
  let z = ap_sum x y in
    z * z ;;

let rec sum_sq i max sum =
  if i > max then
    sum
  else
    sum_sq (i + 1) max (sum + (i * i)) ;;
   
let pe006 i max =
  Printf.printf "%d\n" (abs((sq_sum i max) - (sum_sq i max 0))) ;;

let main () =
  pe006 1 maxv ;;

let () = main ()
