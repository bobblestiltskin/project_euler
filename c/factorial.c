#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int mul_int_string(const int, const char *, char *);

int factorial(int num, char *factorial)
{
printf("ENTERING factorial BEFORE is %d and FACTORIAL is %s\n", num, factorial);
  int i;
  int status = 0;
  char *tmp = calloc(2, sizeof(char));
  for (i = 1; i < num;++i)
  {
printf("factorial BEFORE i is %d and FACTORIAL is %s\n", i, factorial);
    status = mul_int_string(i+1, factorial, tmp);
printf("factorial AFTER i is %d and FACTORIAL is %s and TMP is %s\n", i, factorial, tmp);
//    strncpy(factorial, tmp, strlen(factorial));
    strcpy(factorial, tmp);
printf("factorial AFTER i is %d and FACTORIAL is %s\n", i, factorial);
  }
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n", num, factorial);
  return(status);
}
