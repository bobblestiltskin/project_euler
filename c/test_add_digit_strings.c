#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

int add_digit_strings(const char *, const char *, char **);
int call_add_digit_strings(const int, const char **, const char **, const char **);

int main(int argc, char **argv)
{
  const char *input1[2] = {
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"
  };
  const char *input2[2] = {
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281",
    "7541512359106598196500948594445793979047755011263161330795391021835765656018579039106380927366183295858884680470886768343530118053888",
  };
  const char *output[2] = {
    "75415123591065981965009486792878080189969847218988330183105732861230095327291440105545299230185469260678988704176722012130921964663406552974761438647138281",
    "848420140399492297106364258387510929241068939715700095508460537711534899463420937290489690094351639363163632933902127621942997165742870886768343530118053888"
  };

  int status = call_add_digit_strings(0, input1, input2, output);
  if (!status)
    status = call_add_digit_strings(1, input1, input2, output);

  return(status);
}

int call_add_digit_strings(const int index, const char **input1, const char **input2, const char **output)
{
  char *a = (char *) calloc(strlen(input1[index]) + 1, sizeof(char));
  strncpy(a, input1[index], strlen(input1[index]));
  int lena = strlen(a);

  char *b = (char *) calloc(strlen(input2[index]) + 1, sizeof(char));
  strncpy(b, input2[index], strlen(input2[index]));
  int lenb = strlen(b);

  int maxlen = (lena >lenb) ? lena : lenb;
  char *c = (char *) calloc(maxlen + 1, sizeof(char));

  int status = add_digit_strings(a, b, &c);
  if (strncmp(c, output[index], strlen(output[index])))
    printf("%s + %s is %s and should be %s\n", a, b, c, output[index]);

  free(c);
  free(b);
  free(a);
  return status;
}

