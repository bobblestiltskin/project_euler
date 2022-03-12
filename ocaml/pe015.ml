open Int64

let rec gen_list n max list =
  if n = max then
    n :: list
  else
    gen_list (n + 1) max (n :: list) ;;

let rec prod_list arr index prod =
  if index = 0 then
    prod
  else
    let nexti = index - 1 in
      let next_prod = prod * arr.(nexti) in
        prod_list arr nexti next_prod ;;

let maxv = 40 ;;
let half = maxv / 2 ;;

let num = Array.of_list (gen_list (half + 1) maxv []) ;;
let denom = Array.of_list (gen_list 1 half []) ;;

let update i j num denom =
  num.(i) <- num.(i) / denom.(j);
  denom.(j) <- 1 ;;
  
let main () =
  (* factor the 2 vectors *)
  for i = 0 to half-1 do
    for j = 0 to half-1 do
      if (denom.(j) > 1) then 
        if ((num.(i) mod denom.(j)) = 0) then
          update i j num denom
    done;
  done;

(*  let nprod = prod_list num half 1L in *)
(*  let dprod = prod_list denom half 1L in *)
(*  Printf.printf "%Ld\n" (div nprod dprod) ;; *)
  let nprod = prod_list num half 1 in
  let dprod = prod_list denom half 1 in
  Printf.printf "%d\n" (nprod / dprod) ;;

let () = main ()
