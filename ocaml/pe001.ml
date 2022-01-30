let divisible_5 x = x mod 5 = 0 ;;
let divisible_3 x = x mod 3 = 0 ;;

let rec pe001 count sum =
  if count > 0 then
    if (divisible_5 count || divisible_3 count) then
      pe001 (count - 1) (sum + count)
    else 
      pe001 (count - 1) sum
  else 
    Printf.printf "%d\n" sum ;;

let main () =
  pe001 999 0

let () = main ()
