#include <stdio.h>
#include <stdlib.h>
#include <math.h>

unsigned int is_prime(unsigned int, unsigned int, unsigned int *);

int main()
{
  unsigned int last = 2000000;

  unsigned int *primes = (unsigned int *) calloc(1, sizeof(unsigned int));
  *primes = 2;
  unsigned int numprimes = 1;

  unsigned long long sum = 2;
  unsigned int test;
  for (test = 3; test < last; test+=2)
  {
    if (is_prime(test, numprimes, primes))
    {
      primes = realloc(primes, sizeof(int)*(numprimes+1));
      primes[numprimes++] = test;
      sum += test;
    }
  }
  printf("%llu\n", sum);    
  free(primes);
  exit(0);
}

unsigned int is_prime(unsigned int test, unsigned int numprimes, unsigned int *primes)
{
  int root = (int) sqrt(test);
  unsigned int i;
  for (i=0; i<numprimes; i++)
  {
    if (primes[i] > root)
      return 1;
    if (!(test % primes[i]))
      return 0;
  }
  return 0;
}
