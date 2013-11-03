#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

int main()
{
  unsigned long long number = 600851475143ull;
  int max_prime = 0;
  int i = 3;
  while (number != 1)
  {
    if ((number % i))
    {
      i+=2;
    }
    else
    {
      max_prime = i;
      number = number/i;
    }
  }
  printf("%d\n", max_prime);
  exit(0);
}
