#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

/* this really needs assetions to guarantee that we are working with numbers in the strings. */
/* and we should use strnlen rather than strlen etc. yada */

int add_digit_strings(char *, char *, char *);

int main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Need 2 arg\n");
    return(1);
  }

  int lena = strlen(argv[1]);
  char *a = (char *) calloc(lena + 1, sizeof(char));
  strcpy(a, argv[1]);
  int lenb = strlen(argv[2]);
  char *b = (char *) calloc(lenb + 1, sizeof(char));
  strcpy(b, argv[2]);
  int maxlen = (lena >lenb) ? lena : lenb;
  char *c = (char *) calloc(maxlen + 1, sizeof(char));

//  strcpy(a, "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000");
//  strcpy(a, "99999");
//  char *b = (char *) calloc(158, sizeof(char));
//  strcpy(b, "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000");
//  strcpy(b, "999999");

printf("BEFORE a is %s and B is %s and C is %s\n", a, b, c);
  int status = add_digit_strings(a, b, c);
printf("AFTER a is %s and B is %s and C is %s\n", a, b, c);
  return(status);
}
