let divisible x y  = 
  Int64.(rem x y = zero) ;;

let rec pe003 n i =
(*    Printf.printf "n is %Lu and i is %Lu\n" n i ;; *)
  let open Int64 in
    if n = one then
      Printf.printf "%Lu\n" (i - of_int 2)
    else
      if (divisible n bi) then
        pe003 (n / i) (i + of_int 2)
      else
        pe003 n (i + of_int 2) ;;

let main () =
  pe003 600851475143L 3L ;;

let () = main ()
