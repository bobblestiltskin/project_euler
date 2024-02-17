// This is a solution for http://projecteuler.net/problem=18

#include <cstdio>
#include <algorithm>
#include <vector>

int main() {
  std::vector< std::vector<int> > data;

  int arow1[1] = {75};
  std::vector<int> row1(arow1, arow1 + sizeof(arow1) / sizeof(arow1[0]));
  data.push_back(row1);

  int arow2[2] = {95, 64};
  std::vector<int> row2(arow2, arow2 + sizeof(arow2) / sizeof(arow2[0]));
  data.push_back(row2);

  int arow3[3] = {17, 47, 82};
  std::vector<int> row3(arow3, arow3 + sizeof(arow3) / sizeof(arow3[0]));
  data.push_back(row3);

  int arow4[4] = {18, 35, 87, 10};
  std::vector<int> row4(arow4, arow4 + sizeof(arow4) / sizeof(arow4[0]));
  data.push_back(row4);

  int arow5[5] = {20,  4, 82, 47, 65};
  std::vector<int> row5(arow5, arow5 + sizeof(arow5) / sizeof(arow5[0]));
  data.push_back(row5);

  int arow6[6] = {19,  1, 23, 75,  3, 34};
  std::vector<int> row6(arow6, arow6 + sizeof(arow6) / sizeof(arow6[0]));
  data.push_back(row6);

  int arow7[7] = {88,  2, 77, 73,  7, 63, 67};
  std::vector<int> row7(arow7, arow7 + sizeof(arow7) / sizeof(arow7[0]));
  data.push_back(row7);

  int arow8[8] = {99, 65,  4, 28,  6, 16, 70, 92};
  std::vector<int> row8(arow8, arow8 + sizeof(arow8) / sizeof(arow8[0]));
  data.push_back(row8);

  int arow9[9] = {41, 41, 26, 56, 83, 40, 80, 70, 33};
  std::vector<int> row9(arow9, arow9 + sizeof(arow9) / sizeof(arow9[0]));
  data.push_back(row9);

  int arow10[10] = {41, 48, 72, 33, 47, 32, 37, 16, 94, 29};
  std::vector<int> row10(arow10, arow10 + sizeof(arow10) / sizeof(arow10[0]));
  data.push_back(row10);

  int arow11[11] = {53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14};
  std::vector<int> row11(arow11, arow11 + sizeof(arow11) / sizeof(arow11[0]));
  data.push_back(row11);

  int arow12[12] = {70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57};
  std::vector<int> row12(arow12, arow12 + sizeof(arow12) / sizeof(arow12[0]));
  data.push_back(row12);

  int arow13[13] = {91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48};
  std::vector<int> row13(arow13, arow13 + sizeof(arow13) / sizeof(arow13[0]));
  data.push_back(row13);

  int arow14[14] = {63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31};
  std::vector<int> row14(arow14, arow14 + sizeof(arow14) / sizeof(arow14[0]));
  data.push_back(row14);

  int arow15[15] = { 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60, 4, 23};
  std::vector<int> row15(arow15, arow15 + sizeof(arow15) / sizeof(arow15[0]));
  data.push_back(row15);

// we process the data from the bottom of the triangle and compute the maximum
// of adjacent values and add these maxima to the previous row and iterate
  for (int i = data.size(); i > 0; --i)
    for (int j = 0; j < (i - 1); ++j)
      data[i-2][j] += std::max(data[i-1][j], data[i-1][j+1]);

  printf("%d\n", data[0][0]);

  return 0;
}
