-- this computes projecteuler.net problem 017

onek = "one thousand"
hcount = 7 -- "hundred" 
handcount = 10 -- "hundred and "
units = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}
tens = {"ten", "eleven", "twelve", "thirteen",
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
"ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"}

count = 0

len_units = 9
len_tens = 90
for i = 1, len_units do
  count = string.len(units[i]) + count
end

for i = 1, len_tens do
  count = string.len(tens[i]) + count
end

for i = 1, len_units do
  count = string.len(units[i]) + hcount + count
  for j = 1,  len_units do
    count = string.len(units[i]) + handcount + string.len(units[j]) + count
  end
  for j = 1, len_tens do
    count = string.len(units[i]) + handcount + string.len(tens[j]) + count
  end
end

count = string.len(onek) - 1 + count -- contains a space
print(count)
