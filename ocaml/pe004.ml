open Core.Std

let palindromic s = 
  let n = String.length s in 
    let h = ((n / 2)  + 1) in
      let result = ref true in
      for i = 0 to h do
        if (phys_equal s.[i] s.[n - i - 1])
        then
         printf "" (* nop - want to invert test? *)
        else
         result := false;
      done;
      !result
;;

let pe004 max =
  let maxval = ref 0 in
    for i = 0 to max do
      for j = 0 to max do 
        let product = i * j in
          if (palindromic (sprintf "%06d" product)) then
            if (product > !maxval) then
              maxval := product;
      done;
    done;
    !maxval;;

printf "%d" (pe004 999);;
