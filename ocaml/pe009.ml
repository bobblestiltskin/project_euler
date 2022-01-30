let isum = 1000 ;;

let high_eq_lowmid i j  = 
  let k  = isum - (i + j) in
  let i2 = i * i in
  let j2 = j * j in
  let k2 = k * k in
  (i2 > j2 && i2 > k2 && i2 = j2 + k2) ||
  (j2 > i2 && j2 > k2 && j2 = i2 + k2) ||
  (k2 > i2 && k2 > j2 && k2 = i2 + j2) ;;

let rec pe009 i j =
  let lastj = isum - (i + 1) in
  if high_eq_lowmid i j then
    let k = isum - (i + j) in
    Printf.printf "%d\n" (i * j * k)
  else
    if j = lastj then
      pe009 (i + 1) (i + 2)
    else
      pe009 i (j + 1) ;;

let main () =
  pe009 1 2 ;;

let () = main ()
