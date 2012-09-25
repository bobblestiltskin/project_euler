#include <iostream>
#include <cstdint>
#include <cmath>

int main()
{
  const uint64_t number = 600851475143;

  int max_prime = 0;
  int i;
  for (i=2; i<sqrt(number); i++)
  {
    int matched_2 = 0;
    int matched_3 = 0;
    uint64_t divi = 0;
    if (!(number % i))
    {
      divi = number/i;
      std::cout << "FACTOR of " << number << " is (" << i << " * " << divi << ")" << std::endl;
      int j;
      for (j=2; j < sqrt(i); j++)
      {
        if (!(i % j))
        {
          std::cout << "2 FACTOR of " << i << " is (" << j << " * " << i/j << ")" << std::endl;
          matched_2 = 1;
        }
      }
      int k;
      for (k=2; k < sqrt(divi); k++)
      {
        if (!(divi % k))
        {
          std::cout << "3 FACTOR of " << divi << " is (" << k << " * " << divi/k << ")" << std::endl;
          matched_3 = 1;
        }
      }
    }
    if (divi) {
      if (!matched_2 && (i > max_prime))
        max_prime = i;
      if (!matched_3 && (divi > max_prime))
        max_prime = divi;
    }
  }
  std::cout << "MAX PRIME DIVISOR of " << number << " is " << max_prime << std::endl;
  exit(0);
}
