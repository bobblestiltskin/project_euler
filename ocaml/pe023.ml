open Core.Std

let maxv = 28123 ;;

let rec sum_factors count num sum =
  if (count * count) > num then
    sum
  else
    let quotient  = num / count in
    let remainder = num mod count in
    if remainder = 0 then
      if count = quotient then
        sum_factors (count + 1) num (sum + quotient)
      else
        sum_factors (count + 1) num (sum + quotient + count)
    else
      sum_factors (count + 1) num sum ;;

let rec abundant_list list istart iend =
  if istart = iend then
    List.rev list
  else
    let x = sum_factors 2 istart 1 in
    if x > istart then
      abundant_list (istart :: list) (istart + 1) iend
    else
      abundant_list list (istart + 1) iend ;;

let rec print_list list =
  match list with 
  | [] -> printf "complete\n"
  | h :: t -> printf "%d\n" h; print_list t ;;

(* need to have optional parameters here... put bool first? *)
(*    | []     -> List.sort_uniq ~cmp:compare s *)
(*    | []     -> List.dedup ?compare:compare s *)
(*    | []     -> List.remove_consecutive_duplicates equal (List.sort ~cmp:compare s) *)
(*    | []     -> List.dedup (List.sort ~cmp:compare s) *)
(*    | []     -> List.dedup s *)
let rec nested_sum b h t l x s n =
  if b = 0 then
    match l with
    | []     -> List.sort ~cmp:compare (List.dedup s)
    | h1 :: t1 -> nested_sum 1 h1 t1 l l s n
  else
    match x with (* xxx is this needed *)
    | h2 :: l2 -> if (h + h2) < n then
                    nested_sum 1 h t l l2 ((h + h2) :: s) n
                  else
                    nested_sum 0 0 [] t l s n 
    | _ -> [] ;;

let rec sum_lists boo x a b s =
  if boo = 0 then
    match x with 
    | [] -> s
    | h :: t -> sum_lists 1 t h b s
  else
    if a = b then
      sum_lists 0 x a (b + 1) s
    else
      sum_lists 1 x a (b + 1) (b + s) ;;
    
let pe021 num =
  let l = abundant_list [] 1 num in
  let s = nested_sum 0 0 [] l l [] num in
  sum_lists 0 s 0 0 0 ;;

printf "%d\n" (pe021 maxv) ;;
