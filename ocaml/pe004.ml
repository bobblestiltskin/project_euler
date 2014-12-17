open Core.Std

let palindromic s = 
  let n = String.length s in 
    let h = ((n / 2)  + 1) in
      let result = ref true in
      for i = 0 to h do
        if (s.[i] <> s.[n - i - 1])
        then
         result := false;
      done;
      !result
;;

let rec jpe004 ival jval minj maxv =
(*  printf "JLOOP - i %d, j %d\n" ival jval; *)
  let prod = ival * jval in
  if (jval = minj) then
    maxv
  else
    if ((palindromic (sprintf "%06d" prod)) && (prod > maxv)) then
      jpe004 ival (jval -1) (prod/1000) prod
    else
      jpe004 ival (jval -1) minj maxv;;

let rec pe004 ival mini maxv =
(*  printf "ival is %d, mini is %d and maxv is %d\n" ival mini maxv; *)
  if (ival = mini) then
    maxv
  else
    let prod = jpe004 ival 999 (maxv/1000) maxv in
(*    printf "i is %d, prod is %d\n" ival prod; *)
    if (prod > maxv) then
      pe004 (ival - 1) (prod/1000) prod
    else
      pe004 (ival - 1) (maxv/1000) maxv;;
      
printf "%d\n" (pe004 999 0 0);;
