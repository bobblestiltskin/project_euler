// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=17

#include <cstdio>
#include <string>
#include <vector>


int main() {
/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
*/

  const int UNITS = 9;
  const int TENS = 90;

  const std::string onek = "one thousand";
  const int hcount = 7; /* "hundred" */
  const int handcount = 10; /* "hundred and " */
  int count = 0;
  const std::vector< std::string > units({"one", "two", "three", "four",
  "five", "six", "seven", "eight", "nine"});
  const std::vector< std::string > tens({"ten", "eleven", "twelve", "thirteen",
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
  "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"});

  for (std::vector< std::string >::const_iterator it = units.begin();
       it < units.end(); it++)
    count += it->length();
  for (std::vector< std::string >::const_iterator it = tens.begin();
       it < tens.end(); it++)
    count += it->length();
  for (std::vector< std::string >::const_iterator it = units.begin();
       it < units.end(); it++) {
    count += it->length() + hcount;
    for (std::vector< std::string >::const_iterator jt = units.begin();
         jt < units.end(); jt++)
      count += it->length() + handcount + jt->length();
    for (std::vector< std::string >::const_iterator jt = tens.begin();
         jt < tens.end(); jt++)
      count += it->length() + handcount + jt->length();
  }

  count += onek.length() - 1;  // contains a space
  printf("COUNT is %d\n", count);
  return(0);
}
