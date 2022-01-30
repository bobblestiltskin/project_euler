let divisible x y  = 
  Int64.(rem x y = zero) ;;

let rec pe003 n i =
(*  Printf.printf "n is %Lu and i is %Lu\n" n i ;; *)
  let open Int64 in
    if n = 1L then
      Printf.printf "%Lu\n" (sub i 2L)
    else
      if (divisible n i) then
        pe003 (div n i) (add i 2L)
      else
        pe003 n (add i 2L) ;;

let main () =
  pe003 600851475143L 3L ;;

let () = main ()
