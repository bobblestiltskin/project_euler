// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>
#include <cassert>

const int BASE = 10;

std::string mul_digit_string(const int, const std::string);
std::string add_digit_strings(const std::string, const std::string);

std::string mul_int_string(int alpha, const std::string in_string) {
#ifdef DEBUG
printf("ENTERING mul_int_string with alpha of %d and in_string of %s\n",
alpha, in_string.c_str());
#endif

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

#ifdef DEBUG
printf("LEAVING mul_int_string with alpha of %d", alpha);
printf(" and in_string of %s and outstring of %s\n",
in_string.c_str(), out_string.c_str());
#endif

  return out_string;
}
