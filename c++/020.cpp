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

std::string factorial(int num) {
  std::string fac_string = "1";
  for (int i = 0; i < num; ++i)
    fac_string = mul_int_string(i+1, fac_string);

  return(fac_string);
}

std::string mul_int_string(int alpha, const std::string in_string) {
  /* multiplies the input string in_string by the integer alpha */

  std::string in_copy = in_string;
  std::string out_string = "0";

  do {
    int modulo = alpha % BASE;
    if (modulo) {
      if (modulo == 1) {
        std::string out_current = out_string;
        out_string = add_digit_strings(out_current, in_copy);
      } else {
        std::string row = mul_digit_string(modulo, in_copy);
        std::string out_current = out_string;
        out_string = add_digit_strings(out_current, row);
      }
    }
    in_copy = in_copy + "0";  // multiply by 10
  } while ((alpha = alpha / BASE));

  return out_string;
}

std::string mul_digit_string(const int digit, const std::string in_string) {
  /* multiplies the in_string by a single digit */

  assert(digit >= 0);
  assert(digit <= 9);

  std::string out_string;
  if (digit == 0)
    return out_string;
  else
    if (digit == 1) {
      return in_string;
    } else {
    out_string.resize(in_string.length());
    int carry = 0;
    for (int i = in_string.length(); i > 0; --i) {
      int in = in_string.at(i - 1) - '0';

      assert(in >= 0);
      assert(in <= 9);

      int product = in * digit + carry;
      int newval = product % BASE;
      out_string.at(i - 1) = newval + '0';
      carry = product / BASE;
    }

    if (carry) {
      std::ostringstream tmp;
      tmp << carry;

      out_string = tmp.str() + out_string;
    }
  }

  return out_string;
}
