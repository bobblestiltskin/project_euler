#include <stdio.h>
//#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define BASE 10

/* this really needs assetions to guarantee that we are working with numbers in the strings. */
/* and we should use strnlen rather than strlen etc. yada */

int mul_int_string(int alpha, char *in_string, char *out_string)
{
printf("mul_int_string - %d and %s\n",  alpha, in_string);
  /* multiplies the input string in_string by the integer alpha */
  strcpy(out_string, "0");


 int in_length = strlen(in_string); 
printf("1. LEN in_string is %d\n", in_length);
printf("1. LEN in_string is %d\n", (int) strlen(in_string));
printf("1. LEN out_string is %d\n", (int) strlen(out_string));

  do {
//    out_string = realloc(out_string, strlen(out_string) + 1);
printf("2. LEN out_string is %d\n", (int) strlen(out_string));
    int modulo = alpha % BASE;
    printf("ALPHA is %d and MODULO is %d\n", alpha, modulo);
    char *row = (char *) calloc(in_length + 1, sizeof(char));
//printf("OK1\n");
printf("in_string is %s\n", in_string);
    int mds_ret = mul_digit_string(modulo, in_string, row);
//printf("OK1\n");
printf("row is %s\n", row);
printf("3. LEN out_string is %d\n", (int) strlen(out_string));
    add_digit_strings(row, out_string, out_string);
printf("4. LEN out_string is %d\n", (int) strlen(out_string));
printf("BACK FROM add_digit_strings\n");
printf("ROW is %d and ROW STRING is %s\n", (int) strlen(row), row);
printf("OLEN is %d and OUT STRING is %s\n", (int) strlen(out_string), out_string);
printf("out_string is %s\n", out_string);
printf("OK2\n");
printf("LEN is %d\n", (int) strlen(in_string));
    in_string = realloc(in_string, strlen(in_string) + 2);
//printf("in_string is %s\n", in_string);
    strncat(in_string, "0",1);
//printf("LEN is %d\n", (int) strlen(in_string));
//printf("OK3\n");
    free(row);
  } while ((alpha = alpha / BASE));
  
  return 0;
}
