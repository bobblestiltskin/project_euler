// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>
#include <vector>

void call_mul_digit_string(const int, const std::vector<int>,
                           const std::vector< std::string >,
                           const std::vector< std::string >);
std::string mul_digit_string(const int, const std::string);

int main() {
  std::vector<int> scalars({9, 7});

  std::vector< std::string > numeric_input({
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",  // NOLINT
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000"  // NOLINT
  });
  const std::vector< std::string > numeric_output({
    "678736112319593837685085373500121458114297951013684519771585191965218909041672113519574283462956496627299621242379809150917710624849920000000000000000000000",  // NOLINT
    "5938940982796446079744497018126062758500107071369739548001370429695665454114630993296274980300869345488871685870823330070529967967436800000000000000000000000"  // NOLINT
  });

  call_mul_digit_string(0, scalars, numeric_input, numeric_output);
  call_mul_digit_string(1, scalars, numeric_input, numeric_output);

  return(0);
}

void call_mul_digit_string(const int index, const std::vector<int> scalars,
                           const std::vector< std::string > numeric_input,
                           const std::vector< std::string > numeric_output) {
  int a = scalars.at(index);
  std::string b = numeric_input.at(index);

  std::string c = mul_digit_string(a, b);
  if (c != numeric_output.at(index))
    printf("%d * %s is %s and should be %s\n", a, b.c_str(),
           c.c_str(), numeric_output.at(index).c_str());
}
