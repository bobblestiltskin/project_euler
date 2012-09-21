#include <iostream>
#include <cstdint>
#include <sstream>

const int MAX3 = 999;
const int MIN3 = 100;
const int MAXDIGITS = 6;

bool is_palindromic(std::string &);

int main()
{
  uint32_t maxp = 0;
  std::string digits;

  uint16_t mini = MIN3;
  uint16_t minj = MIN3;
  uint16_t i;
  for (i = MAX3; i >= mini; i--)
  {
    uint16_t j;
    for (j = MAX3; j >= minj; j--)
    {
      uint32_t product = i * j;
      std::stringstream tmp;
      tmp << product;
      digits = tmp.str();
      if (is_palindromic(digits))
      {
        std::cout << "PALINDROME " << product << " of " << i << " * " << j << std::endl;
        if (product > maxp)
        {
          maxp = product;
          mini = minj = product / 1000; /* optimize */
        }
      }
    }
  }
  std::cout << "MAXP is " << maxp << std::endl;
  
  return 0;
}

bool is_palindromic(std::string &digits)
{
  uint8_t i;
  uint8_t len = digits.length();

  for (i=0;i<len;i++) /* only really need to test half of the string - if even and int(half)+1 if odd  - but more complexity */
    if (digits[i] != digits[len-(i+1)])
      return 0;

  return 1;
}
