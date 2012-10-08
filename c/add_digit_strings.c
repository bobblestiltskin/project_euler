#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BASE 10

int add_digit_strings(char *in_1_string, char *in_2_string, char *out_string)
{
  /* generate out_string by adding in_2_string to in_1_string */

printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s\n", in_1_string, in_2_string);
//printf("ENTERING add_digit_strings\n");
//printf("ILEN1 is %d and IN 1 STRING is %s\n", (int) strlen(in_2_string), in_2_string);
//printf("ILEN2 is %d and IN 2 STRING is %s\n", (int) strlen(in_1_string), in_1_string);

  int maxlen, minlen;
  if (strlen(in_2_string) < strlen(in_1_string)) 
  {
    char *tmp = in_2_string;
    in_2_string = in_1_string;
    in_1_string = tmp;
  }
  minlen = strlen(in_1_string);
  maxlen = strlen(in_2_string);

  int carry = 0;
  int j;
  for (j = minlen; j > 0; --j)
  {
    int index = ((int) strlen(in_2_string))-minlen+j-1;
    int tmp = *(in_1_string+j-1) - '0' + *(in_2_string+index) - '0' + carry;
    *(out_string+index) = tmp % BASE + '0';
    carry = tmp / BASE;
  }
  for (j = maxlen - minlen; j > 0; --j)
  {
    int tmp = *(in_2_string+j-1) - '0' + carry;
    *(out_string+j-1) = tmp % BASE + '0';
    carry = tmp / BASE;
  }
  if (carry)
  {
    out_string = realloc(out_string, strlen(out_string) + 2);
    for (j=strlen(out_string) + 1; j>0; --j)
      *(out_string+j) = *(out_string+j-1);
    *out_string = carry + '0';
  }
//printf("END ILEN is %d and IN1 STRING is %s\n", (int) strlen(in_2_string), in_2_string);
//printf("END ILEN is %d and IN1 STRING is %s\n", (int) strlen(in_1_string), in_1_string);
//printf("END OLEN is %d and OUT STRING is %s\n", (int) strlen(out_string), out_string);
printf("LEAVING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s and OUT STRING is %s\n", in_1_string, in_2_string, out_string);

  return 0;
}
