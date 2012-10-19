// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=17

#include <cstdio>
#include <string>
#include <vector>


int main() {

  const std::string onek = "one thousand";
  const int hcount = 7; /* "hundred" */
  const int handcount = 10; /* "hundred and " */

  const std::string units_array[9] = {"one", "two", "three", "four",
  "five", "six", "seven", "eight", "nine"};
  const std::vector< std::string > units(units_array,
    units_array + sizeof(units_array) / sizeof(units_array[0]));

  const std::string tens_array[90] = {"ten", "eleven", "twelve", "thirteen",
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
  "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"};
  const std::vector< std::string > tens(tens_array,
    tens_array + sizeof(tens_array) / sizeof(tens_array[0]));

  int count = 0;

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
  printf("%d\n", count);
  return(0);
}
