// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>
#include <vector>

void call_mul_int_string(const int, const std::vector<int>,
                         const std::vector< std::string >,
                         const std::vector< std::string >);
std::string mul_int_string(const int, const std::string);

int main() {
  std::vector<int> scalars({453, 79, 11});

  std::vector< std::string > numeric_input({
    "848420140399492297106356716875151822642872438767105649714481489956523636302090141899467854328695620784124526552974761438647138281062400000000000000000000000",  // NOLINT
    "75415123591065981965009485944457939790477550112631613307953910218357656560185790391063809273661832958588846804708867683435301180538880000000000000000000000",  // NOLINT
    "678736112319593837685085373500121458114297951013684519771585191965218909041672113519574283462956496627299621242379809150917710624849920000000000000000000000"  // NOLINT
  });
  const std::vector< std::string > numeric_output({
    "384334323600970010589179592744443775657221214761498859320660114950305207244846834280458938010899116215208410528497566931707153641321267200000000000000000000000",  // NOLINT
    "5957794763694212575235749389612177243447726458897897451328358907250254868254677440894040932619284803728518897572000546991388793262571520000000000000000000000",  // NOLINT
    "7466097235515532214535939108501336039257277461150529717487437111617407999458393248715317118092521462900295833666177900660094816873349120000000000000000000000"  // NOLINT
  });

  call_mul_int_string(0, scalars, numeric_input, numeric_output);
  call_mul_int_string(1, scalars, numeric_input, numeric_output);
  call_mul_int_string(2, scalars, numeric_input, numeric_output);

  return(0);
}

void call_mul_int_string(const int index, const std::vector<int> scalars,
                         const std::vector< std::string > numeric_input,
                         const std::vector< std::string > numeric_output) {
  int a = scalars.at(index);
  std::string b = numeric_input.at(index);

  std::string c = mul_int_string(a, b);
  if (c != numeric_output.at(index))
    printf("%d * %s is %s and should be %s\n", a, b.c_str(),
           c.c_str(), numeric_output.at(index).c_str());
}
