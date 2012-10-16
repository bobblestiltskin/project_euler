#include <stdio.h>
#include <string.h>

#define UNITS 9
#define TENS 90

int main()
{
/*
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
*/

  char *units[UNITS] = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
  char *tens[TENS] = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
  "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
  "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
  "forty", "fortyone", "fortytwo", "fortythree", "fortyfour", "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
  "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour", "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
  "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour", "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
  "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour", "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
  "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour", "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
  "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour", "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"};
  char *onek = "one thousand";

  int hcount = 7; /* "hundred" */
  int handcount = 10; /* "hundred and " */
  int count = 0;

  int i;
  for (i = 0; i < UNITS; ++i)
     count += strlen(units[i]);
  for (i = 0; i < TENS; ++i)
     count += strlen(tens[i]);
  for (i = 0; i < UNITS; ++i)
  {
    count += strlen(units[i]) + hcount;
    int j;
    for (j = 0; j < UNITS; ++j)
      count += strlen(units[i]) + handcount + strlen(units[j]);
    for (j = 0; j < TENS; ++j)
      count += strlen(units[i]) + handcount + strlen(tens[j]);
  }
  count += strlen(onek) - 1; /* contains a space */
  printf("%d\n", count);
  return(0);
}
