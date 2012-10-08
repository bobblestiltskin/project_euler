#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int mul_digit_string(const int digit, const char *in_string, char *out_string)
{
  /* multiplies the in_string by a single digit */

#ifdef DEBUG
printf("entering mul_digit_string digit is %d input is %s output is %s\n", digit, in_string, out_string);
#endif

  assert(digit >= 0);
  assert(digit <= 9);

  int carry = 0;
  int i;
  for (i = strlen(in_string); i > 0; --i)
  {
    int in = *(in_string + i - 1) - '0';
  
    assert(in >= 0);
    assert(in <= 9);

    int product = in * digit + carry;
    int new = product % BASE;
    *(out_string + i - 1) = new + '0';
    carry = product / BASE;
  }

  if (carry)
  {
    out_string = realloc(out_string, strlen(out_string)+1);
    for (i=strlen(out_string)+1; i>0; --i)
      *(out_string+i) = *(out_string+i-1);
    *out_string = carry + '0';
  }

#ifdef DEBUG
printf("leaving mul_digit_string output is %s\n", out_string);
#endif

  return 0;
}
