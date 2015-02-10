open Core.Std

let limit = 1000 ;;

let rec suma array index accum =
  if index = 0 then
    accum + array.(index)
  else
    suma array (index - 1) (accum + array.(index)) ;;
  
let extenda x = 
  if (x.(0) >= 5 && x.(0) <= 9) then
    Array.append [|0|] x
  else
    x ;;

let rec double_array array index carry =
  let old = array.(index) in
    let old2 = old + old in
      if index = 0 then
        array.(0) <- old2 + carry
      else
        let modulo = old2 mod 10 in
          let ncarry = old2 / 10 in
            array.(index) <- modulo + carry;
            double_array array (index - 1) ncarry ;;

let rec pe016 array iter =
  if iter = limit then
    printf "%d\n" (suma array (Array.length array - 1) 0)
  else
    let narray = extenda array in
      double_array narray (Array.length narray - 1) 0;
      pe016 narray (iter + 1) ;;

pe016 [|1|] 0 ;;
