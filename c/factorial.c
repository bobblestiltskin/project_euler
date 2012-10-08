#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* this really needs assertions to guarantee that we are working with numbers in the strings. */
/* and we should use strnlen rather than strlen etc. yada */

int mul_int_string(const int, const char *, char *);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    return(1);
  }

  int a = atoi(argv[1]);
  char *b = (char *) calloc(2, sizeof(char));
  strncpy(b, "1", 2);
  char *c = (char *) calloc(2, sizeof(char));
  strncpy(c, "0", 2);
  int i;
  int status = 0;
  for (i = 1; i < a;++i)
  {
printf("main BEFORE i is %d and B is %s and C is %s\n", i, b, c);
    status = mul_int_string(i+1, b, c);
printf("main AFTER a is %d and B is %s and C is %s and STATUS is %d\n", i, b, c, status);
    strcpy(b,c);
  }
  return(status);
}
