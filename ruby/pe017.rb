#!/usr/bin/ruby

onek = "one thousand"
hcount = 7 # "hundred" 
handcount = 10 # "hundred and "

units = Array["one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]

tens = Array["ten", "eleven", "twelve", "thirteen",
  "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
  "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour",
  "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
  "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour",
  "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
  "forty", "fortyone", "fortytwo", "fortythree", "fortyfour",
  "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
  "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour",
  "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
  "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour",
  "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
  "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour",
  "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
  "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour",
  "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
  "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour",
  "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"]

count = 0

units.each do |unit|
  count += unit.length
end

tens.each do |ten|
  count += ten.length
end

units.each do |unit|
  count += unit.length + hcount
  units.each do |unit2|
    count += unit.length + handcount + unit2.length
  end
  tens.each do |ten|
    count += unit.length + handcount + ten.length
  end
end

count += onek.length - 1 # contains a space
puts(count)
