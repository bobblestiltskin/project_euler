#include <stdio.h>

/*
You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/

int main()
{
  int cycle[48]  = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

  int count = 0;
  int dow = 2; /* start on tuesday 1901.1.1 */
  int i;
  for (i = 0; i < 25; ++i) // 2000 is a leap year too!
  {
    int j;
    for (j = 0; j < 48; ++j) // 48 months in 4 year cycle
    {
      if (!dow)
        count++;
      dow = (dow + cycle[j]) % 7;
    }
  }
  printf("COUNT is %d\n", count);
  return 0;
}
