open Core

let maxv = 10000 ;;

let rec sum_factors count num sum =
  if (count * count) > num then
    sum + 1
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

let rec pe021 list num sum maxv =
  if num = maxv then
    sum
  else
    let x = (sum_factors 2 num 0) in
    if x < num then
      let y = match List.nth list (num - x - 1) with
      | None -> 0
      | Some x -> x in
      if num = y then
        pe021 (x :: list) (num + 1) (x + num + sum) maxv
      else 
        pe021 (x :: list) (num + 1) sum maxv
    else
      pe021 (x :: list) (num + 1) sum maxv ;;

printf "%d\n" (pe021 [] 1 0 maxv) ;;
