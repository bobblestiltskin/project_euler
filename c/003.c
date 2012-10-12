#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

int main()
{
  uint64_t number = 600851475143;

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
      int j;
      for (j=2; j < sqrt(i); j++)
      {
        if (!(i % j))
          matched_2 = 1;
      }
      int k;
      for (k=2; k < sqrt(divi); k++)
      {
        if (!(divi % k))
          matched_3 = 1;
      }
    }
    if (divi) {
      if (!matched_2 && (i > max_prime))
        max_prime = i;
      if (!matched_3 && (divi > max_prime))
        max_prime = divi;
    }
  }
  printf("%d\n", max_prime);
  exit(0);
}
