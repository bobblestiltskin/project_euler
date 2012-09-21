#include <stdio.h>

int main()
{
  int primes[8] = {2, 3, 5, 7, 11, 13, 17, 19};
/*
maximum power of 2 in 1..20 is 16 or 2^4
maximum power of 3 in 1..20 is 9 or 3^2
maximum power of other primes < 20 is n^1
*/
  int result = 2 * 2 * 2 * 3;
/* we initialise the result to the powers of 2 and 3 above 1 */
  int i;
  for (i=0; i<8; i++)
    result *= primes[i];

  printf("RESULT is %d\n",result);
  
  return 0;
}
