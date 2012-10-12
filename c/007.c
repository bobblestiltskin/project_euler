#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int is_prime(int, int, int *);

int main()
{
  int primenum = 10001;

  int primes[10002] = {2, 3};
  int numprimes = 2;

  int test = primes[numprimes - 1] + 2;
  while (numprimes < primenum)
  {
    if (is_prime(test, numprimes, primes))
      primes[numprimes++] = test;
    test += 2;
  }
  printf("%d\n", primes[numprimes-1]);    
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
