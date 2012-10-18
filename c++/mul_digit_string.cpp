// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <cassert>
#include <string>
#include <sstream>

const int BASE = 10;

std::string mul_digit_string(const int digit,
                             const std::string in_string) {
  /* multiplies the in_string by a single digit */

#ifdef DEBUG
printf("entering mul_digit_string digit is %d input is %s\n",
digit, in_string.c_str());
#endif

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

#ifdef DEBUG
printf("leaving mul_digit_string output is %s\n", out_string.c_str());
#endif

  return out_string;
}
