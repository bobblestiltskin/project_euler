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

let sort_and_remove_duplicates l = 
  let sl = List.sort compare l in
  let rec go l acc = match l with
    | [] -> List.rev acc
    | [x] -> List.rev (x::acc) 
    | (x1::x2::xs) -> 
      if x1 = x2
      then go (x2::xs) acc
      else go (x2::xs) (x1::acc)
in go sl []

let rec nested_sum_3 l s n =
  match l with
  | []     -> sort_and_remove_duplicates s
  | h1 :: t1 -> nested_sum_6 h1 t1 l l s n
and nested_sum_6 h t l x s n =
    match x with (* xxx is this needed *)
    | h2 :: l2 -> if (h + h2) < n then
                    nested_sum_6 h t l l2 ((h + h2) :: s) n
                  else
                    nested_sum_3 t s n 
    | _ -> [] ;;

let rec sum_lists_3 x b s =
  match x with 
  | [] -> s
  | h :: t -> sum_lists_4 t h b s
and sum_lists_4 x a b s = 
  if a = b then
    sum_lists_3 x (b + 1) s
  else
    sum_lists_4 x a (b + 1) (b + s) ;;
    
let pe023 num =
  let l = abundant_list [] 1 num in
  let s = nested_sum_3 l [] num in
  sum_lists_3 s 0 0 ;;

Printf.printf "%d\n" (pe023 maxv) ;;
