#include <cstdio>
#include <vector>

#include "./numstring.h"

int call_add_digit_strings(const int,
                           std::vector< numstring >,
                           const std::vector< numstring >,
                           const std::vector< numstring >);

int main() {
  numstring in1[2] = {
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",  // NOLINT
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"  // NOLINT
  };
  std::vector< numstring > input1(in1, in1 + sizeof(in1)/sizeof(in1[0]));

  numstring in2[2] = {
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281",  // NOLINT
    "7541512359106598196500948594445793979047755011263161330795391021835765656018579039106380927366183295858884680470886768343530118053888",  // NOLINT
  };
  const std::vector< numstring > input2(in2, in2 + sizeof(in2)/sizeof(in2[0]));

  numstring out[2] = {
    "75415123591065981965009486792878080189969847218988330183105732861230095327291440105545299230185469260678988704176722012130921964663406552974761438647138281",  // NOLINT
    "848420140399492297106364258387510929241068939715700095508460537711534899463420937290489690094351639363163632933902127621942997165742870886768343530118053888"  // NOLINT
  };
  const std::vector< numstring > output(out, out + sizeof(out)/sizeof(out[0]));

  call_add_digit_strings(0, input1, input2, output);
  call_add_digit_strings(1, input1, input2, output);

  return(0);
}

int call_add_digit_strings(const int index,
                           std::vector< numstring > input1,
                           const std::vector< numstring > input2,
                           const std::vector< numstring > output) {
  numstring a = input1.at(index);
  numstring b = input2.at(index);

  a += b;
  if (a() != output.at(index)())
    printf("%s + %s is %s and should be %s\n",
           input1.at(index)().c_str(),
           input2.at(index)().c_str(),
           a().c_str(),
           output.at(index)().c_str());
  else
    printf("%d - ALL OK\n", index);

  return 0;
}

