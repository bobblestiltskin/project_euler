// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=20

#include <cstdio>
#include <string>
#include <sstream>
#include <cassert>

const int BASE = 10;

std::string factorial(const int);
std::string mul_int_string(const int, const std::string);
std::string mul_digit_string(const int, const std::string);
std::string add_digit_strings(const std::string, const std::string);
std::string add_strings_short_to_long(const std::string, const std::string);

int main() {
  const int maxa = 100;

  std::string fac_string = factorial(maxa);
  int sum = 0;
  for (unsigned int i = 0; i < fac_string.length(); ++i)
    sum += fac_string.at(i) - '0';
  printf("%d\n", sum);

  return(0);
}
