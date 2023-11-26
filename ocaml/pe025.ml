(*
open Int64
open "zarith.cmxa"
*)

let maxnum = 1000 ;;

let rec pe025 i j n =
  let k = Z.add i j in
  let numlen = String.length (Z.to_string k) in
  if numlen < maxnum then
    pe025 j k (n + 1)
  else
    n ;;

Printf.printf "%d\n" (pe025 Z.zero Z.one 2) ;;
