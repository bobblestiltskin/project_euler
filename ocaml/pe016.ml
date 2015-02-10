open Core.Std

let limit = 1000 ;;

let n0 = [|0|] ;;

let extenda a b = Array.append a b ;;

let rec suma array index accum =
  if index = 0 then
    accum + array.(index)
  else
    suma array (index - 1) (accum + array.(index)) ;;
  
let newa x = 
  if (x.(0) >= 5 && x.(0) <= 9) then
    extenda n0 x
  else
    x ;;

let rec double_el array index carry =
  let old = array.(index) in
    let old2 = old + old in
      if index = 0 then
        array.(0) <- old2 + carry
      else
        let modulo = old2 mod 10 in
          let ncarry = old2 / 10 in
            array.(index) <- modulo + carry;
            double_el array (index - 1) ncarry ;;

let rec pe016 array iter =
  if iter = limit then
    printf "%d\n" (suma array (Array.length array - 1) 0)
  else
    let narray = newa array in
      double_el narray (Array.length narray - 1) 0;
      pe016 narray (iter + 1) ;;

pe016 [|1|] 0 ;;
