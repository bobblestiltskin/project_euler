#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int mul_digit_string(const int digit, const char *in_string, char **out_string_ptr)
{
  /* multiplies the in_string by a single digit */

#ifdef DEBUG
printf("entering mul_digit_string digit is %d input is %s output is %s\n", digit, in_string, *out_string_ptr);
#endif

  assert(digit >= 0);
  assert(digit <= 9);

  if (digit == 0)
    strncpy(*out_string_ptr, "0", 1);
  else if (digit == 1)
    strncpy(*out_string_ptr, in_string, strlen(in_string));
  else
  {
    int carry = 0;
    int i;
    for (i = strlen(in_string); i > 0; --i)
    {
      int in = *(in_string + i - 1) - '0';
    
      assert(in >= 0);
      assert(in <= 9);
  
      int product = in * digit + carry;
      int new = product % BASE;
      *(*out_string_ptr + i - 1) = new + '0';
      carry = product / BASE;
    }
  
    if (carry)
    {
      int out_len = strlen(*out_string_ptr);
      char *tmp = calloc(out_len + 1, sizeof(char));
      strncpy(tmp, *out_string_ptr, out_len);
      *out_string_ptr = realloc(*out_string_ptr, out_len + 2);
      *(*out_string_ptr) = carry + '0';
      *(*out_string_ptr+1) = 0;
      strncat(*out_string_ptr, tmp, strlen(tmp));
      free(tmp);
    }
  }

#ifdef DEBUG
printf("leaving mul_digit_string output is %s\n", *out_string_ptr);
#endif

  return 0;
}
