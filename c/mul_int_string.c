#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int mul_digit_string(const int, const char *, char *);
int add_digit_strings(char *, char *, char *);

int mul_int_string(int alpha, char *in_string, char *out_string)
{
#ifdef DEBUG
printf("ENTERING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, out_string);
#endif

  /* multiplies the input string in_string by the integer alpha */

  int in_len = strlen(in_string);
  strncpy(out_string, "0", 2);
  int in_length = strlen(in_string); 

  do {
    int modulo = alpha % BASE;
//    printf("ALPHA is %d and MODULO is %d\n", alpha, modulo);
    char *row = (char *) calloc(in_length + 1, sizeof(char));
    int mds_ret = mul_digit_string(modulo, in_string, row);
    assert (mds_ret == 0);
    add_digit_strings(row, out_string, out_string);
    in_string = realloc(in_string, strlen(in_string) + 2);
    strncat(in_string, "0", 1);
    free(row);
  } while ((alpha = alpha / BASE));
  in_string = realloc(in_string, in_len + 1);
  *(in_string + in_len) = 0;

#ifdef DEBUG
printf("LEAVING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, out_string);
#endif
  
  return 0;
}
