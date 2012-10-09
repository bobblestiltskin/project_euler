#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int mul_digit_string(const int, const char *, char *);
int add_digit_strings(char *, char *, char *);

int mul_int_string(int alpha, const char *in_string, char *out_string)
{
#ifdef DEBUG
printf("ENTERING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, out_string);
#endif

  /* multiplies the input string in_string by the integer alpha */

  int in_length = strlen(in_string); 
  char *tmp = calloc(in_length + 1, sizeof(char));
  strncpy(tmp, in_string, in_length);
  strncpy(out_string, "0", 2);

  do {
    int modulo = alpha % BASE;
//    printf("ALPHA is %d and MODULO is %d\n", alpha, modulo);
    char *row = (char *) calloc(in_length + 1, sizeof(char));
    int mds_ret = mul_digit_string(modulo, tmp, row);
    assert (mds_ret == 0);
    add_digit_strings(row, out_string, out_string);
    tmp = realloc(tmp, strlen(tmp) + 2);
    strncat(tmp, "0", 1);
    free(row);
  } while ((alpha = alpha / BASE));
//  in_string = realloc(in_string, in_length + 1);
//  *(in_string + in_length) = 0;
  free(tmp);

#ifdef DEBUG
printf("LEAVING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, out_string);
#endif
  
  return 0;
}
