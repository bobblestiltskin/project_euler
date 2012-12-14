#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*

c.f.

long int fac(unsigned long int n) {
    return lround(exp(lgamma(n+1)));
}

http://www.evanmiller.org/mathematical-hacker.html

*/

int mul_int_string(const int, const char *, char **);

int factorial(int num, char **factorial_ptr)
{
#ifdef DEBUG
printf("ENTERING factorial BEFORE is %d and FACTORIAL is %s\n", num, *factorial_ptr);
#endif

  int status = 0;
  char *tmp = calloc(2, sizeof(char));
  int i;
  for (i = 1; i < num;++i)
  {
    status = mul_int_string(i+1, *factorial_ptr, &tmp);
    *factorial_ptr = realloc(*factorial_ptr, strlen(tmp) + 1);
    strcpy(*factorial_ptr, tmp);
  }
  free (tmp);

#ifdef DEBUG
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n", num, *factorial_ptr);
#endif

  return(status);
}
