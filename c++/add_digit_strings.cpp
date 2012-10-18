// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>
#include <sstream>
#include <cassert>

const int BASE = 10;

std::string add_strings_short_to_long(const std::string, const std::string);

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
