open Core.Std

let january       = 31 ;;
let february      = 28 ;;
let march         = 31 ;;
let april         = 30 ;;
let may           = 31 ;;
let june          = 30 ;;
let july          = 31 ;;
let august        = 31 ;;
let september     = 30 ;;
let october       = 31 ;;
let november      = 30 ;;
let december      = 31 ;;
let leap_february = 29 ;;

let num_cycles    = 25 ;;

let mardec    = [march; april; may; june; july; august; september; october; november; december] ;;
let year      = List.append [january; february] mardec ;;
let leap_year = List.append [january; leap_february] mardec ;;
let cycle     = List.append (List.append year year) (List.append year leap_year) ;;

let rec process_month months daynum daycount =
  match months with
  | [] -> (daynum, daycount)
  | head::body ->
    let day = ((daynum + head) mod 7) in 
      if day = 0 then
        process_month body day (daycount + 1)
      else
        process_month body day daycount ;;

let rec pe019 count months daynum daycount =
  if count = 0 then
    daycount
  else
    let (tn, tc) = (process_month months daynum daycount) in
      pe019 (count - 1) months tn tc ;;

printf "%d\n" (pe019 num_cycles cycle 2 0) ;;
