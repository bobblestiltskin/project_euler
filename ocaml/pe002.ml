let even x = x mod 2 = 0 ;;

let rec pe002 n previous current sum =
  if current > n then
    Printf.printf "%d\n" sum
  else
    if even current then 
      pe002 n current (previous + current) (sum + current)
    else 
      pe002 n current (previous + current) sum;;

let main () =
  pe002 4_000_000 1 1 0

let () = main ()
