// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=19

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

#include <cstdio>
#include <vector>

int main() {
  const std::vector<int> cycle({31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                         31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31});

  int count = 0;
  int dow = 2;  // start on tuesday 1901.1.1
                // 2000 is a leap year too!
  for (int i = 0; i < 25; ++i) {
    for (std::vector<int>::const_iterator jt = cycle.begin();
         jt < cycle.end(); ++jt) {
      if (!dow)
        count++;
      dow = (dow + *jt) % 7;
    }
  }
  printf("COUNT is %d\n", count);
  return 0;
}
