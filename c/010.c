#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int is_prime(int, int, int *);

int main()
{
  int last = 2000000;

  int *primes = (int *) calloc(2, sizeof(int));
  *primes = 2;
  *(primes+1) = 3;
  int numprimes = 2;

  int test = primes[numprimes - 1] + 2;
  while (test < last)
  {
    if (is_prime(test, numprimes, primes))
    {
      primes = realloc(primes, sizeof(int)*(numprimes+1));
      primes[numprimes++] = test;
    }
    test += 2;
  }
  int64_t sum = 0;
  int i;
  for (i=0; i < numprimes; ++i)
  {
    sum += primes[i];
  }
  printf("%ld\n", sum);    
  free(primes);
  exit(0);
}

int is_prime(int test, int numprimes, int *primes)
{
  int root = (int) sqrt(test);
  int i;
  for (i=0; i<numprimes; i++)
  {
    if (primes[i] > root)
      return 1;
    if (!(test % primes[i]))
      return 0;
  }
  return 0;
}
