-- this computes projecteuler.net problem 017
units = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

tens = [
      "ten",
      "eleven",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen",
      "twenty",
      "twentyone",
      "twentytwo",
      "twentythree",
      "twentyfour",
      "twentyfive",
      "twentysix",
      "twentyseven",
      "twentyeight",
      "twentynine",
      "thirty",
      "thirtyone",
      "thirtytwo",
      "thirtythree",
      "thirtyfour",
      "thirtyfive",
      "thirtysix",
      "thirtyseven",
      "thirtyeight",
      "thirtynine",
      "forty",
      "fortyone",
      "fortytwo",
      "fortythree",
      "fortyfour",
      "fortyfive",
      "fortysix",
      "fortyseven",
      "fortyeight",
      "fortynine",
      "fifty",
      "fiftyone",
      "fiftytwo",
      "fiftythree",
      "fiftyfour",
      "fiftyfive",
      "fiftysix",
      "fiftyseven",
      "fiftyeight",
      "fiftynine",
      "sixty",
      "sixtyone",
      "sixtytwo",
      "sixtythree",
      "sixtyfour",
      "sixtyfive",
      "sixtysix",
      "sixtyseven",
      "sixtyeight",
      "sixtynine",
      "seventy",
      "seventyone",
      "seventytwo",
      "seventythree",
      "seventyfour",
      "seventyfive",
      "seventysix",
      "seventyseven",
      "seventyeight",
      "seventynine",
      "eighty",
      "eightyone",
      "eightytwo",
      "eightythree",
      "eightyfour",
      "eightyfive",
      "eightysix",
      "eightyseven",
      "eightyeight",
      "eightynine",
      "ninety",
      "ninetyone",
      "ninetytwo",
      "ninetythree",
      "ninetyfour",
      "ninetyfive",
      "ninetysix",
      "ninetyseven",
      "ninetyeight",
      "ninetynine"
    ]


sum_list [] count = count
sum_list (x:xs) count = sum_list xs (count + length x)

one_to_99 = (sum_list units 0) + (sum_list tens 0)

sum_hundreds [] _ _ count = count
sum_hundreds (x:xs) hundred one_to_99 count = sum_hundreds xs hundred one_to_99 (count + (((length x) + length(hundred)) * 100) + ((length "and") * 99) + one_to_99)

pe017 :: Int
pe017 = length "one" + length "thousand" + (sum_hundreds units "hundred" one_to_99 0) + one_to_99

main = print(pe017)
