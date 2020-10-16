// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=24

#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#include <cstdio>
#include <iomanip>
#include <string>
#include <sstream>

/*
  9! is 362880 so after all the 10 digit numbers which 
  start with 0 or 1 we will have passed 725760 of the 
  combinations. The millionth combination will start
  with a 2, since we need to count 274240 more combinations
  after 2000000000.

  8! is 40320, so there are that many 10 digit combinations starting 20.
  The combination starting 22 is invalid (since the numerals must be
  distinct), so we could count 6 sets of combinations of 40320 up to
  2700000000 and then we would have seen 725760+241920 leaving 32320 to
  find.

  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.
*/

int main() {
  uint64_t start = 2000000000;
  start += 780000000;
  const uint64_t end   = 9876543210ull;

  uint64_t count = 725760 + 241920 + 30240;
  uint64_t i;
  for (i = start; i <= end; ++i) {
    std::string digits;
    std::ostringstream tmp;
    tmp << std::setfill('0') << std::setw(10) << i;
    digits = tmp.str();

    if (digits.find("0") == std::string::npos)
      continue;
    if (digits.find("1") == std::string::npos)
      continue;
    if (digits.find("2") == std::string::npos)
      continue;
    if (digits.find("3") == std::string::npos)
      continue;
    if (digits.find("4") == std::string::npos)
      continue;
    if (digits.find("5") == std::string::npos)
      continue;
    if (digits.find("6") == std::string::npos)
      continue;
    if (digits.find("7") == std::string::npos)
      continue;
    if (digits.find("8") == std::string::npos)
      continue;
    if (digits.find("9") == std::string::npos)
      continue;

    count++;
    if (count == 1000000)
      break;
  }
  printf("%" PRIu64 "\n", i);
  return(0);
}
