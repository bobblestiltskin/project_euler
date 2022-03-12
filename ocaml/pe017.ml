let units = ["one";"two";"three";"four";"five";"six";"seven";"eight";"nine"] ;;
let tens = ["ten";"eleven";"twelve";"thirteen";"fourteen";"fifteen";"sixteen";"seventeen";"eighteen";"nineteen";"twenty";"twentyone";"twentytwo";"twentythree";"twentyfour";"twentyfive";"twentysix";"twentyseven";"twentyeight";"twentynine";"thirty";"thirtyone";"thirtytwo";"thirtythree";"thirtyfour";"thirtyfive";"thirtysix";"thirtyseven";"thirtyeight";"thirtynine";"forty";"fortyone";"fortytwo";"fortythree";"fortyfour";"fortyfive";"fortysix";"fortyseven";"fortyeight";"fortynine";"fifty";"fiftyone";"fiftytwo";"fiftythree";"fiftyfour";"fiftyfive";"fiftysix";"fiftyseven";"fiftyeight";"fiftynine";"sixty";"sixtyone";"sixtytwo";"sixtythree";"sixtyfour";"sixtyfive";"sixtysix";"sixtyseven";"sixtyeight";"sixtynine";"seventy";"seventyone";"seventytwo";"seventythree";"seventyfour";"seventyfive";"seventysix";"seventyseven";"seventyeight";"seventynine";"eighty";"eightyone";"eightytwo";"eightythree";"eightyfour";"eightyfive";"eightysix";"eightyseven";"eightyeight";"eightynine";"ninety";"ninetyone";"ninetytwo";"ninetythree";"ninetyfour";"ninetyfive";"ninetysix";"ninetyseven";"ninetyeight";"ninetynine"] ;;

let update_sum x y =
  x + (String.length y) ;;

let sum_list mlist =
  List.fold_left update_sum 0 mlist ;;

let ucount x y mlist =
  List.fold_left update_sum ((String.length x + String.length y) * List.length mlist) mlist ;;

let get_hundred x y =
  x + String.length y + String.length "hundred" + 
  ucount y "hundredand" units + 
  ucount y "hundredand" tens ;;

let pe017 =
  sum_list units + sum_list tens + 
  (List.fold_left get_hundred 0 units) +
  String.length "onethousand" ;;

let main () =
  Printf.printf "%d\n" pe017 ;;

let () = main ()
