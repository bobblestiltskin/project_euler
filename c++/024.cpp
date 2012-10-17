// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=24

#include <cstdint>
#include <cstdio>
#include <iomanip>
#include <string>
#include <sstream>

int main() {
  const uint64_t start = 123456789;
  const uint64_t end = 9876543210;

  uint64_t count = 0;
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
  printf("%lu\n", i);
  return(0);
}
