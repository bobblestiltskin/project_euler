package main

import (
	"fmt"
)

func main() {
	const UNITS = 9
	const TENS = 90

	units := []string{"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}
	tens := []string{"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
  "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
  "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
  "forty", "fortyone", "fortytwo", "fortythree", "fortyfour", "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
  "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour", "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
  "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour", "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
  "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour", "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
  "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour", "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
  "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour", "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"}
	const onek = "one thousand"

	const hcount = 7 // "hundred"
	const handcount = 10 // "hundred and "
	var count int

	for i := 0; i < len(units); i++ {
		count += len(units[i])
	}
	for i := 0; i < len(tens); i++ {
		count += len(tens[i])
	}
	for i := 0; i < len(units); i++ {
		count += len(units[i]) + hcount
		for j := 0; j < len(units); j++ {
			count += len(units[i]) + handcount + len(units[j])
		}
		for j := 0; j < len(tens); j++ {
			count += len(units[i]) + handcount + len(tens[j])
		}
	}
	count += len(onek) - 1;
	fmt.Printf("%d\n", count)
}
