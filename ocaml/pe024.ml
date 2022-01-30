open Int64

(*
9! is 362880 so after all the 10 digit numbers which 
start with 0 or 1 we will have passed 725760 of the 
combinations. The millionth combination will start
with a 2, since we need to count 274240 more combinations
after 2000000000.

8! is 40320, so there are that many 10 digit combinations starting 20.
The combination starting 22 is invalid (since the numerals must be
distinct), so we could count 6 sets of combinations of 40320 up to
2700000000 and then we would have seen 725760+241920 leaving 32320 to
find.

7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.
*)

let maxcount   = 1000000L    ;;
let startcount = 997920L     ;;
let startnum   = 2780000000L ;;

let rec pe024 n result =
  if result = maxcount then
    sub n one
  else
    let ns = to_string n in
      if String.contains ns '0' &&
         String.contains ns '1' &&
         String.contains ns '2' &&
         String.contains ns '3' &&
         String.contains ns '4' &&
         String.contains ns '5' &&
         String.contains ns '6' &&
         String.contains ns '7' &&
         String.contains ns '8' &&
         String.contains ns '9' then
           pe024 (add n one) (add result one)
         else
           pe024 (add n one) result ;;

let main () =
  Printf.printf "%Ld\n" (pe024 startnum startcount) ;;

let () = main ()
