#include <cstdio>
#include <cstring>
#include <cassert>

#include <sstream>
#include <string>

const int BASE = 10;

class numstring : public std::string {
  // A numstring is a string composed of the characters '0' - '9' 
  // and can be used for arbitrarily wide integers e.g. factorials of large numbers
  private:
    std::string nstring;
    std::string add_strings_short_to_long(const numstring&, const numstring&);
    void add_digit_strings(const numstring&);
    void mul_digit_string(const int);
    void mul_int_string(const int);
  public:
    numstring() {nstring = "0";};
    numstring(const char *);
    numstring(const std::string);
    numstring(const numstring&);
    numstring& operator = (const numstring&);
    ~numstring() {};
    numstring& operator += (const numstring& rhs) 
    {
      this->add_digit_strings(rhs);
      return *this;
    }
    numstring& operator *= (const int& alpha) 
    {
      this->mul_int_string(alpha);
      return *this;
    }
    std::string get() const;
};

inline numstring operator + (numstring lhs, const numstring& rhs)
{
  lhs += rhs;
  return lhs;
}

inline numstring operator * (numstring lhs, const int& alpha)
{
  lhs *= alpha;
  return lhs;
}
