let palindromic s = 
  let n = String.length s in 
    if (n < 3) then 
     if (n = 2) then 
       s.[0] = s.[1]
     else
       true 
    else
      let h = ((n / 2)  + 1) in
        let result = ref true in
          let i = ref 0 in
            while (!result && (!i <= h)) do
              if (s.[!i] <> s.[n - !i - 1]) then result := false;
              i := !i + 1
            done;
            !result
;;

let rec jpe004 ival jval minj maxv =
  let prod = ival * jval in
  if (jval = minj) then
    maxv
  else
    if ((palindromic (Printf.sprintf "%06d" prod)) && (prod > maxv)) then
      jpe004 ival (jval -1) (prod/1000) prod
    else
      jpe004 ival (jval -1) minj maxv;;

let rec pe004 ival mini maxv =
  if (ival = mini) then
    maxv
  else
    let prod = jpe004 ival 999 (maxv/1000) maxv in
    if (prod > maxv) then
      pe004 (ival - 1) (prod/1000) prod
    else
      pe004 (ival - 1) (maxv/1000) maxv;;
      
Printf.printf "%d\n" (pe004 999 0 0);;
