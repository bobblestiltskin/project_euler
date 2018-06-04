open Core

let maxnum = 1000 ;;

let rec pe025 i j n =
  let k = Big_int.add_big_int i j in
  let numlen = String.length (Big_int.string_of_big_int k) in
  if numlen < maxnum then
    pe025 j k (n + 1)
  else
    n ;;

printf "%d\n" (pe025 Big_int.zero_big_int Big_int.unit_big_int 2) ;;
