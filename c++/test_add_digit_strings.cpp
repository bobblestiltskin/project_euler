// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>
#include <vector>

std::string add_digit_strings(std::string, std::string);
int call_add_digit_strings(const int, const std::vector< std::string >,
                           const std::vector< std::string >,
                           const std::vector< std::string >);

int main() {
  std::vector< std::string > input1({
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",  // NOLINT
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"  // NOLINT
  });
  std::vector< std::string > input2({
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281",  // NOLINT
    "7541512359106598196500948594445793979047755011263161330795391021835765656018579039106380927366183295858884680470886768343530118053888",  // NOLINT
  });
  const std::vector< std::string > output({
    "75415123591065981965009486792878080189969847218988330183105732861230095327291440105545299230185469260678988704176722012130921964663406552974761438647138281",  // NOLINT
    "848420140399492297106364258387510929241068939715700095508460537711534899463420937290489690094351639363163632933902127621942997165742870886768343530118053888"  // NOLINT
  });

  call_add_digit_strings(0, input1, input2, output);
  call_add_digit_strings(1, input1, input2, output);

  return(0);
}

int call_add_digit_strings(const int index,
                           const std::vector< std::string > input1,
                           const std::vector< std::string > input2,
                           const std::vector< std::string > output) {
  std::string a = input1.at(index);
  std::string b = input2.at(index);

  std::string c = add_digit_strings(a, b);
  if (c != output.at(index))
    printf("%s + %s is %s and should be %s\n", a.c_str(), b.c_str(),
           c.c_str(), output.at(index).c_str());

  return 0;
}

