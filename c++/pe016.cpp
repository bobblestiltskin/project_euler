// This is a solution for http://projecteuler.net/problem=16

#include <cstdio>
#include <string>

const int ASCII = 48;

std::string double_string(std::string);

int main() {
  int max = 1000;

// initialise a string to 2 - we store ASCII because it is easier to print
// we could store the raw numbers for a little better performance

  std::string in_string = "1";

  for (int i = 0; i < max; ++i)
    in_string = double_string(in_string);

  int sum = 0;
  for (std::string::iterator it = in_string.begin();
       it < in_string.end();
       it++)
    sum += *it - ASCII;

  printf("%d\n", sum);
  return(0);
}

std::string double_string(std::string in) {
//  given a string containing an integer this function will double the value
//  the string will be extended if necessary to hold the number

  int first = in.at(0) - ASCII;  // use ASCII in string
  int ra = 0;
  if ((first == 5) || (first == 6) || (first == 7) ||
      (first == 8) || (first == 9)) {
    // extend string by a character
    in.resize(in.size() + 1);
    ra = 1;
  }

  // walk backwards through the string doubling as we go
  int carry = 0;
//  for (std::string::reverse_iterator rit = in.rbegin();
//         rit < in.rend(); rit++ )
//  mmm maybe not this walks backwards and we want to modify different points
//  so doing it explicitly using indexing is easier
  for (int j = in.size(); j > 0; --j) {
    int i = j - 1;
    switch (in.at(i)-ASCII) {
      case 0:
        in.at(i+ra) = 0 + ASCII + carry;
        carry = 0;
        break;
      case 1:
        in.at(i+ra) = 2 + ASCII + carry;
        carry = 0;
        break;
      case 2:
        in.at(i+ra) = 4 + ASCII + carry;
        carry = 0;
        break;
      case 3:
        in.at(i+ra) = 6 + ASCII + carry;
        carry = 0;
        break;
      case 4:
        in.at(i+ra) = 8 + ASCII + carry;
        carry = 0;
        break;
      case 5:
        in.at(i+ra) = 0 + ASCII + carry;
        carry = 1;
        break;
      case 6:
        in.at(i+ra) = 2 + ASCII + carry;
        carry = 1;
        break;
      case 7:
        in.at(i+ra) = 4 + ASCII + carry;
        carry = 1;
        break;
      case 8:
        in.at(i+ra) = 6 + ASCII + carry;
        carry = 1;
        break;
      case 9:
        in.at(i+ra) = 8 + ASCII + carry;
        carry = 1;
        break;
    }
  }
  if (carry) {
    in.at(0) = 0 + ASCII + carry;
    carry = 0;
  }
  return in;
}
