#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

int main()
{
  uint64_t number = 600851475143;
  uint64_t root = 775147; // the first odd integer larger than root(number)

  int max_prime = 0;
  int i;
  for (i=root; i>2; i=i-2) // just use odd factors
  {
    int matched_2 = 0;
    int matched_3 = 0;
    uint64_t divi = 0;
    if (!(number % i))
    {
      divi = number/i;
      int j;
      for (j=3; j < sqrt(i); j=j+2) // ignore even here too
      {
        if (!(i % j))
          matched_2 = 1;
      }
      int k;
      for (k=3; k < sqrt(divi); k=k+2) // ignore even here too
      {
        if (!(divi % k))
          matched_3 = 1;
      }
    }
    if (divi) {
      if (!matched_2)
        max_prime = i;
      if ((!matched_3) && (divi > max_prime))
        max_prime = divi;
    }
    if (max_prime)
      break;
  }
  printf("%d\n", max_prime);
  exit(0);
}
