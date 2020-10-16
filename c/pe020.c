#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int factorial(const int, char **);
int mul_int_string(const int, const char *, char **);
int mul_digit_string(const int, const char *, char **);
int add_digit_strings(const char *, const char *, char **);
int add_strings_short_to_long(const char *, const char *, char **);
int handle_carry(int, char **);

int main()
{
  int maxa = 100;
  char *b = (char *) calloc(2, sizeof(char));
  strcpy(b, "1");
  factorial(maxa, &b);
  int sum = 0;
  int i;
  for(i=0; i<strlen(b); ++i)
    sum += *(b+i) - '0';
  printf("%d\n", sum);

  free(b);
  return(0);
}
