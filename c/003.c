#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>

void set_max_prime(const uint64_t big, int* max_prime_ptr)
{
  int is_prime = 1;
  int count = 3;
  while (is_prime && ((count*count) < big)) {
    if (!(big % count))
      is_prime = 0;
    count = count + 2;
  }
  if (is_prime && ((int)big > *max_prime_ptr))
    *max_prime_ptr = (int) big;
} 

int main()
{
  uint64_t number = 600851475143;
  int root = 775147; // the first odd integer larger than root(number)

  int max_prime = 0;
  int i;
  for (i=root; i>2; i=i-2) // just use odd factors
  {
    uint64_t divi = 0;
    if (!(number % i))
    {
      divi = number/i;
      set_max_prime(i, &max_prime);
      set_max_prime(divi, &max_prime);
    }
  }
  printf("%d\n", max_prime);
  exit(0);
}
