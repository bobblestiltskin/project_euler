#include <stdio.h>
#include <string.h>

#define UNITS 9
#define TENS 90

int main()
{
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
