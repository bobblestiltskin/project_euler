open Core.Std

let pe001 n =
  let divisible_5 x = x mod 5 = 0 in 
  let divisible_3 x = x mod 3 = 0 in 
  let count = ref 0 in
  let sum = ref 0 in
  while !count < n do
    if divisible_5 !count then sum := !sum + !count else
    if divisible_3 !count then sum := !sum + !count;
    count := !count + 1;
  done;
  printf "%d\n" !sum;;

pe001 1000
