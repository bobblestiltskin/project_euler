function pe017(): number {
  const UNITS = 9
  const TENS = 90

  let units = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  let tens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
    "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
    "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
    "forty", "fortyone", "fortytwo", "fortythree", "fortyfour", "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
    "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour", "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
    "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour", "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
    "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour", "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
    "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour", "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
    "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour", "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"]
  let onek = "one thousand"

  let hcount = 7 // "hundred"
  let handcount = 10 // "hundred and "
  let count = 0

  for (let i = 0; i < UNITS; ++i)
    count += units[i].length
  for (let i = 0; i < TENS; ++i)
    count += tens[i].length
  for (let i = 0; i < UNITS; ++i)
  {
    count += units[i].length + hcount
    for (let j = 0; j < UNITS; ++j)
      count += units[i].length + handcount + units[j].length
    for (let j = 0; j < TENS; ++j)
      count += units[i].length + handcount + tens[j].length
  }
  count += onek.length - 1 // contains a space
  return count
}

console.log(pe017())
