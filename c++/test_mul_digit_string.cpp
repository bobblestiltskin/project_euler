// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <vector>

#include "./numstring.h"

void call_mul_digit_string(const int,
                           const std::vector<int>,
                           std::vector< numstring >,
                           const std::vector< numstring >);

int main() {
  int sa[2] = {9, 7};
  std::vector<int> scalars(sa, sa + sizeof(sa)/sizeof(sa[0]));

  numstring in[2] = {
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",  // NOLINT
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"  // NOLINT
  };
  std::vector< numstring > numeric_input(in, in + sizeof(in)/sizeof(in[0]));

  numstring out[2] = {
    "678736112319593837685085373500121458114297951013684519771585191965218909041672113519574283462956496627299621242379809150917710624849920000000000000000000000",  // NOLINT
    "5938940982796446079744497018126062758500107071369739548001370429695665454114630993296274980300869345488871685870823330070529967967436800000000000000000000000"  // NOLINT
  };
  const std::vector< numstring > numeric_output(out,
                     out + sizeof(out)/sizeof(out[0]));

  call_mul_digit_string(0, scalars, numeric_input, numeric_output);
  call_mul_digit_string(1, scalars, numeric_input, numeric_output);

  return(0);
}

void call_mul_digit_string(const int index,
                           const std::vector<int> scalars,
                           std::vector< numstring > numeric_input,
                           const std::vector< numstring > numeric_output) {
  int a = scalars.at(index);
  numstring b = numeric_input.at(index);

  b.mul_digit_string(a);
  if (b.get() != numeric_output.at(index).get())
    printf("%d * %s is %s and should be %s\n",
            a, numeric_input.at(index).get().c_str(),
            b.get().c_str(), numeric_output.at(index).get().c_str());
  else
    printf("INDEX %d ALL OK\n", index);
}
