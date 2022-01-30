let ascii_offset = 64 ;;
let maxv = 10000 ;;
let names_f = "../names.txt" ;;

(* read_line just reads the first line from the file *)
let read_line filename =
  let chan = open_in filename in
    input_line chan ;;

let split_by_comma string =
  Str.split (Str.regexp_string ",") string ;;

(*
let top_and_tail string =
  String.sub string ~pos:1 ~len:(String.length string - 2) ;;
*)

let rec sum_chars index string sum =
(* stop on index 0 because all out strings are surrounded by "" *)
  match index with
  | 0 -> sum
  | _ -> sum_chars (index - 1) string (sum + (int_of_char (String.get string index) - ascii_offset)) ;;

let rec process_name names index sum =
  match names with
  | []           -> sum
  | head :: tail -> let sc = (sum_chars (String.length head - 2) head 0) in
                    let nexti = (index + 1) in 
                    process_name tail nexti (sum + (sc * nexti)) ;;

let all_names = read_line names_f ;;
let rec sort = function
    | [] -> []
    | x :: l -> insert x (sort l)
  and insert elem = function
    | [] -> [elem]
    | x :: l -> if elem < x then elem :: x :: l
                else x :: insert elem l;;
(* let names_list = List.sort ~cmp:compare (split_by_comma all_names) ;; *)
let names_list = sort (split_by_comma all_names) ;;
Printf.printf "%d\n" (process_name names_list 0 0) ;;
