#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BASE 10

int mul_digit_string(const int digit, const char *in_string, char *out_string)
{
  /* multiplies the in_string by the digit */
printf("STRING LEN is %d\n", (int) strlen(in_string));
  int carry = 0;
  int i;
  for (i = strlen(in_string); i > 0; --i)
  {
    int in = *(in_string + i - 1) - '0';
    int product = in * digit + carry;
    int new = product % BASE;
    *(out_string + i - 1) = new + '0';
//printf("INDEX is %d NUM is %d, PRODUCT is %d and new is %d and carry is %d and os is %s\n", i, *(in_string + i - 1) - '0', product, new, carry, out_string);
    carry = product / BASE;
  }

//  for (i=0; i<strlen(out_string) + 1; ++i)
//    printf("BEFORE CARRY - I is %d and CHAR is %d\n", i, *(out_string+i));

  if (carry)
  {
//printf("IN CARRY _ LEN1 is %d\n", (int) strlen(out_string));
    out_string = realloc(out_string, strlen(out_string)+1);
//printf("IN CARRY _ LEN2 is %d\n", (int) strlen(out_string));
    for (i=strlen(out_string)+1; i>0; --i)
      *(out_string+i) = *(out_string+i-1);
    *out_string = carry + '0';
  }

//  for (i=0; i<strlen(out_string) + 1; ++i)
//    printf("AFTER CARRY - I is %d and CHAR is %d\n", i, *(out_string+i));

printf("OS is %s\n", out_string);
  return 0;
}
