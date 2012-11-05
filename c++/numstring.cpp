// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include "./numstring.h"

numstring::numstring(const std::string instring) {
  for (std::string::const_iterator it = instring.begin();
       it < instring.end();
       it++) {
    assert(*it >= '0');
    assert(*it <= '9');
  }

  nstring = instring;
}

numstring::numstring(const char* instring) {
  for (unsigned int i = 0; i < strlen(instring); ++i) {
    assert(*(instring+i) >= '0');
    assert(*(instring+i) <= '9');
  }

  nstring = instring;
}

numstring::numstring(const numstring& old_string) {
  nstring = old_string.nstring;
}

numstring& numstring::operator = (const numstring& old_string) {
  nstring = old_string.nstring;

  return *this;
}

std::string numstring::get() const {
  return nstring;
}

std::string numstring::add_strings_short_to_long(const numstring& short_string,
                                                 const numstring& long_string) {
  /* generate out_string by adding short_string to long_string */

#ifdef DEBUG
printf("ENTERING add_strings_short_to_long SHORT STRING is %s ",
short_string.get().c_str());
printf("LONG STRING is %s\n", long_string.get().c_str());
#endif

  std::string out_string;

  int min_len = short_string.get().length();
  int max_len = long_string.get().length();
  assert(min_len <= max_len);
  out_string.resize(max_len);

  if (short_string != "0") {
    int carry = 0;
    /* walk backwards along the shorter string and add elements */
    for (int j = min_len; j > 0; --j) {
      int index = max_len - min_len + j - 1;
      int in1 = short_string.get().at(j-1) - '0';
      assert(in1 >= 0);
      assert(in1 <= 9);
      int in2 = long_string.get().at(index) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in1 + in2 + carry;
      out_string.at(index) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* then handle any character positions only in longer string */
    for (int j = max_len - min_len; j > 0; --j) {
      int in2 = long_string.get().at(j-1) - '0';
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
printf("LEAVING add_strings_short_to_long IN 1 STRING is %s\n",
short_string.get().c_str());
printf("LEAVING add_strings_short_to_long IN 2 STRING is %s\n",
long_string.get().c_str());
printf("LEAVING add_strings_short_to_long OUT STRING is %s\n",
out_string.c_str());
#endif

  return out_string;
}

void numstring::add_digit_strings(const numstring& in_1_string) {
  /* generate out_string by adding in_1_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s\n",
in_1_string.get().c_str());
#endif

  std::string out_string;

  /* if the second string is shorter than the first, swap them */
  if (nstring.length() < in_1_string.get().length())
    out_string = add_strings_short_to_long(*this, in_1_string);
  else
    out_string = add_strings_short_to_long(in_1_string, *this);

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n",
in_1_string.get().c_str());
printf("LEAVING add_digit_strings OUT STRING is %s\n",
out_string.c_str());
#endif

  nstring = out_string;
}

void numstring::mul_digit_string(const int digit) {
  /* multiplies the in_string by a single digit */

#ifdef DEBUG
printf("entering mul_digit_string digit is %d\n", digit);
printf("AND NUMSTRING is now %s\n", nstring.c_str());
#endif

  assert(digit >= 0);
  assert(digit <= 9);

  std::string out_string;  // NOLINT
  if (digit == 0)
    return;
  else
    if (digit == 1) {
      return;
    } else {
    out_string.resize(nstring.length());
    int carry = 0;
    for (int i = nstring.length(); i > 0; --i) {
      int in = nstring.at(i - 1) - '0';

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

  nstring = out_string;
}

void numstring::mul_int_string(int alpha) {
#ifdef DEBUG
printf("ENTERING mul_int_string with alpha of %d\n", alpha);
#endif

  /* multiplies the input string in_string by the integer alpha */

  numstring in_copy(nstring);
  numstring out_string("0");

  do {
    int modulo = alpha % BASE;
    if (modulo) {
      if (modulo == 1) {
        out_string += in_copy;
      } else {
        numstring row(in_copy);
        row.mul_digit_string(modulo);
        out_string += row;
      }
    }
    in_copy = in_copy.get() + "0";  // multiply by 10
  } while ((alpha = alpha / BASE));

#ifdef DEBUG
printf("LEAVING mul_int_string with alpha of %d", alpha);
printf(" and outstring of %s\n", out_string.get().c_str());
#endif

  nstring = out_string.nstring;
}
