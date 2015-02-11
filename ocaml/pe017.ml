open Core.Std

let units = ["one";"two";"three";"four";"five";"six";"seven";"eight";"nine"] ;;
let tens = ["ten";"eleven";"twelve";"thirteen";"fourteen";"fifteen";"sixteen";"seventeen";"eighteen";"nineteen";"twenty";"twentyone";"twentytwo";"twentythree";"twentyfour";"twentyfive";"twentysix";"twentyseven";"twentyeight";"twentynine";"thirty";"thirtyone";"thirtytwo";"thirtythree";"thirtyfour";"thirtyfive";"thirtysix";"thirtyseven";"thirtyeight";"thirtynine";"forty";"fortyone";"fortytwo";"fortythree";"fortyfour";"fortyfive";"fortysix";"fortyseven";"fortyeight";"fortynine";"fifty";"fiftyone";"fiftytwo";"fiftythree";"fiftyfour";"fiftyfive";"fiftysix";"fiftyseven";"fiftyeight";"fiftynine";"sixty";"sixtyone";"sixtytwo";"sixtythree";"sixtyfour";"sixtyfive";"sixtysix";"sixtyseven";"sixtyeight";"sixtynine";"seventy";"seventyone";"seventytwo";"seventythree";"seventyfour";"seventyfive";"seventysix";"seventyseven";"seventyeight";"seventynine";"eighty";"eightyone";"eightytwo";"eightythree";"eightyfour";"eightyfive";"eightysix";"eightyseven";"eightyeight";"eightynine";"ninety";"ninetyone";"ninetytwo";"ninetythree";"ninetyfour";"ninetyfive";"ninetysix";"ninetyseven";"ninetyeight";"ninetynine"] ;;
let huncount  =  7 ;; (* hundred *)
let handcount = 10 ;; (* hundred and *)
let thoucount = 11 ;; (* one thousand *)

let update_sum x y =
  x + (String.length y) ;;

let sum_list list =
  List.fold_left ~f:update_sum ~init:0 list ;;

let ucount x y list =
  List.fold_left ~f:update_sum
                 ~init:((y + String.length x) * List.length list) 
                 list ;;

let get_hundred y x =
  y + String.length x + huncount + 
  ucount x handcount units + 
  ucount x handcount tens ;;

let pe017 =
  sum_list units + sum_list tens + 
  (List.fold_left ~f:get_hundred ~init:0 units) + thoucount ;;

printf "%d\n" pe017 ;;
