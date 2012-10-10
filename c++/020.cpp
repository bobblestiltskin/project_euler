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

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg\n");
    return(1);
  }
  int maxa;
  std::stringstream ssout(argv[1]);
  ssout >> maxa;

  std::string fac_string = factorial(maxa);
  int sum = 0;
  for (unsigned int i = 0; i < fac_string.length(); ++i)
    sum += fac_string.at(i) - '0';
  printf("%d\n", sum);

  return(0);
}

std::string factorial(int num) {
#ifdef DEBUG
printf("ENTERING factorial BEFORE is %d\n", num);
#endif

  std::string fac_string = "1";
  for (int i = 0; i < num; ++i)
    fac_string = mul_int_string(i+1, fac_string);

#ifdef DEBUG
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n",
num, fac_string.c_str());
#endif

  return(fac_string);
}

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
printf("LEAVING mul_int_string with alpha of %d and in of %s and out of %s\n",
alpha, in_string.c_str(), out_string.c_str());
#endif

  return out_string;
}

std::string mul_digit_string(const int digit, const std::string in_string) {
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

std::string add_digit_strings(const std::string in_1_string,
                              const std::string in_2_string) {
  /* generate out_string by adding in_2_string to in_1_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s\n",
in_1_string.c_str(), in_2_string.c_str());
#endif

  std::string out_string;

  /* if the second string is shorter than the first, swap them */
  if (in_2_string.length() < in_1_string.length())
    out_string = add_strings_short_to_long(in_2_string, in_1_string);
  else
    out_string = add_strings_short_to_long(in_1_string, in_2_string);

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n", in_1_string.c_str());
printf("LEAVING add_digit_strings IN 2 STRING is %s\n", in_2_string.c_str());
printf("LEAVING add_digit_strings OUT STRING is %s\n", out_string.c_str());
#endif

  return out_string;
}

std::string add_strings_short_to_long(const std::string short_string,
                                      const std::string long_string) {
  /* generate out_string by adding short_string to long_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings SHORT STRING is %s LONG STRING is %s\n",
short_string.c_str(), long_string.c_str());
#endif

  std::string out_string;

  int min_len = short_string.length();
  int max_len = long_string.length();
  assert(min_len <= max_len);
  out_string.resize(max_len);

  if (short_string != "0") {
    int carry = 0;
    /* walk backwards along the shorter string and add elements */
    for (int j = min_len; j > 0; --j) {
      int index = max_len - min_len + j - 1;
      int in1 = short_string.at(j-1) - '0';
      assert(in1 >= 0);
      assert(in1 <= 9);
      int in2 = long_string.at(index) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in1 + in2 + carry;
      out_string.at(index) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* then handle any character positions only in longer string */
    for (int j = max_len - min_len; j > 0; --j) {
      int in2 = long_string.at(j-1) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in2 + carry;
      out_string.at(j-1) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* need to move the string characters */
    if (carry) {
      std::ostringstream tmp;
      tmp << carry;

      out_string = tmp.str() + out_string;
    }
  } else {
    out_string = long_string;
  }

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n", short_string.c_str());
printf("LEAVING add_digit_strings IN 2 STRING is %s\n", long_string.c_str());
printf("LEAVING add_digit_strings OUT STRING is %s\n", out_string.c_str());
#endif

  return out_string;
}
