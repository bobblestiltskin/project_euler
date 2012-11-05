#include <cstdio>
#include <cstring>
#include <string>
#include <iostream>
#include <sstream>
#include <cassert>

const int BASE = 10;

class numstring : public std::string {
  // A numstring is a string composed of the characters '0' - '9' 
  // and can be used for arbitrarily wide integers e.g. factorials of large numbers
  private:
    std::string nstring;
//    std::string add_strings_short_to_long(const numstring& shortstring, const numstring& longstring);
    std::string add_strings_short_to_long(const numstring& shortstring, const numstring& longstring);
  public:
    numstring() {nstring = "0";};
    numstring(const char *);
    numstring(const std::string);
    numstring(const numstring&);
    numstring& operator = (const numstring&);
    ~numstring() {};
// copy and assignment??? xxx
//    numstring operator + (const numstring& in1, const numstring& in2);
    void add_digit_strings(const numstring& in1);
    void mul_digit_string(const int);
    void mul_int_string(int alpha);
    std::string get() const;
};

//inline numstring operator + (const numstring& in_1_string, const numstring& in_2_string) {
//  return numstring::add_digit_strings(in_1_string, in_2_string);
//}
