#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int add_digit_strings(char *in_1_string, char *in_2_string, char *out_string)
{
  /* generate out_string by adding in_2_string to in_1_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s\n", in_1_string, in_2_string);
#endif

  /* if the second string is shorter than the first, swap them */
  if (strlen(in_2_string) < strlen(in_1_string)) 
  {
    char *tmp = in_2_string;
    in_2_string = in_1_string;
    in_1_string = tmp;
  }
  int minlen = strlen(in_1_string);
  int maxlen = strlen(in_2_string);

  if (in_1_string && minlen)
  {
    int carry = 0;
    int j;
    /* walk backwards along the shorter string and add elements */
    for (j = minlen; j > 0; --j)
    {
      int index = maxlen - minlen + j - 1;
      int in1 = *(in_1_string+j-1) - '0';
      assert(in1 >= 0);
      assert(in1 <= 9);
      int in2 = *(in_2_string+index) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in1 + in2 + carry;
      *(out_string+index) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* then handle any character positions only in longer string */
    for (j = maxlen - minlen; j > 0; --j)
    {
      int in2 = *(in_2_string+j-1) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in2 + carry;
      *(out_string+j-1) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* need to move the string characters */
    if (carry)
    {
      out_string = realloc(out_string, strlen(out_string) + 2);
  //    for (j=strlen(out_string) + 1; j>0; --j)
  //      *(out_string+j) = *(out_string+j-1);
      memmove(out_string + 1, out_string, strlen(out_string));
      *out_string = carry + '0';
    }
  }
  else
  {
    strncpy(out_string, in_2_string, strlen(in_2_string));
  }

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s and OUT STRING is %s\n", in_1_string, in_2_string, out_string);
#endif

  return 0;
}
