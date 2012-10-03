#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int is_prime(int, int, int *);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg - the ordinal of the prime to find\n");
    exit(1);
  }
  int last = atoi(argv[1]);

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
  printf("SUM of all primes less than %d is %ld\n", last, sum);    
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
