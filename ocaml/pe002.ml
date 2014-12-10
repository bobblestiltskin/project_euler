open Core.Std

let pe002 n =
  let even x = x mod 2 = 0 in
  let sum = ref 0 in
  let previous = ref 1 in
  let current = ref 1 in
  let next = ref 0 in
  while !current < n do
    next := !current + !previous;
    if even !current then sum := !sum + !current;
    previous := !current;
    current := !next;
  done;
  printf "%d\n" !sum;;

pe002 4_000_000
