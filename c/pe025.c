#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*

c.f. 

long int fib(unsigned long int n) {
   return lround((pow(0.5 + 0.5 * sqrt(5.0), n) - 
                  pow(0.5 - 0.5 * sqrt(5.0), n)) / 
                 sqrt(5.0));
}

http://www.evanmiller.org/mathematical-hacker.html

*/

void fib(int, char ***);
int add_strings_short_to_long(const char *, const char *, char **);

int main()
{
  int maxlen = 1000;

  int i = 0;
  char **vector = (char **) calloc(1, sizeof(char *));
  fib(i, &vector);

  while (strlen(vector[i]) < maxlen)
    fib(++i, &vector);

  int j;
  for (j=0; j <= i; ++j)
    free(vector[j]);
  free(vector);

  printf("%d\n", i);
  exit(0);
}

void fib(int num, char ***vector)
{
/* assumes that it is called in a loop with num starting at 0 */

  *vector = realloc(*vector, (num + 1) * sizeof(char *));

  if (num < 2)
  {
    char *nextfib = (char *) calloc(2, sizeof(char));
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wformat-truncation"
    snprintf(nextfib, 2, "%d", num);
#pragma GCC diagnostic pop
    *(nextfib+1) = 0;
    *(*vector+num) = nextfib;
  }
  else
  {
    char *nextfib = (char *) calloc(strlen(*(*vector+num-1)) + 1, sizeof(char));
    add_strings_short_to_long(*(*vector+num-2), *(*vector+num-1), &nextfib);
    *(*vector+num) = nextfib;
  }
}
