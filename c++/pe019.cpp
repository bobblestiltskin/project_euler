// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=19

#include <cstdio>
#include <vector>

int main() {
  const int carray[48] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  const std::vector<int> cycle(carray,
                               carray + sizeof(carray) / sizeof(carray[0]));

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
  printf("%d\n", count);
  return 0;
}
