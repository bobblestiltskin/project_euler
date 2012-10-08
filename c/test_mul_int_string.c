#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int mul_int_string(const int, const char *, char *);
int call_mul_int_string(const int, const int *, const char **, const char **);

int main(int argc, char **argv)
{
  int scalars[2] = {79, 453};
  const char *input[2] = {
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"
  };

  const char *output[2] = {
    "5957794763694212575235749389612177243447726458897897451328358907250254868254677440894040932619284803728518897572000546991388793262571520000000000000000000000",
    "384334323600970010589179592744443775657221214761498859320660114950305207244846834280458938010899116215208410528497566931707153641321267200000000000000000000000"
  };

  int status = call_mul_int_string(0, scalars, input, output);
  if (!status)
    status = call_mul_int_string(1, scalars, input, output);

  return(status);
}

int call_mul_int_string(const int index, const int *scalars, const char **input, const char **output)
{
  int a = scalars[index];
  char *b = (char *) calloc(strlen(input[index]) + 1, sizeof(char));
  strncpy(b, input[index], strlen(input[index]));
  char *c = (char *) calloc(strlen(b) + 1, sizeof(char));

  int status = mul_int_string(a, b, c);
  if (strncmp(c, output[index], strlen(output[index])))
    printf("%d * %s is %s and should be %s\n", a, b, c, output[index]);

  return status;
}
