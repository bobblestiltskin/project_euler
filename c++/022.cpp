// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=22

#include <cstdio>
#include <fstream>  // NOLINT
// Fairly natural use of a stream to read file to a string?
#include <string>
#include <vector>
#include <algorithm>

int main() {
  std::string filename = "../names.txt";
  std::ifstream names_file(filename);
  if (names_file.bad()) {
    printf("ERROR: Cannot open %s\n", filename.c_str());
    return 1;
  }

  std::string name_string;
  if (names_file.is_open())
    names_file >> name_string;

  std::vector< std::string > names;
  int start = 1;
  for (unsigned int i = 1; i < name_string.length(); ++i) {
    if (name_string[i] == '"' && name_string[i+1] == ','
        && name_string[i+2] == '"') {
      names.push_back(name_string.substr(start, i - start));
      start = i + 3;
    }
  }
  names.push_back(name_string.substr(start, name_string.length() - 1));

  std::sort(names.begin(), names.end());

  int result = 0;
  for (unsigned int i = 0; i < names.size(); ++i) {
    int letters = 0;
    for (unsigned int j = 0; j < names.at(i).length(); ++j)
      letters += names.at(i).at(j) - 64;
    result += letters * (i+1);
  }

  printf("%d\n", result);
  return(0);
}
