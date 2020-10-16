#include <stdio.h>
#include <math.h>

#define ROWS 15

int max(int, int);

int main()
{
  int row1[1]   = {75};
  int row2[2]   = {95, 64};
  int row3[3]   = {17, 47, 82};
  int row4[4]   = {18, 35, 87, 10};
  int row5[5]   = {20,  4, 82, 47, 65};
  int row6[6]   = {19,  1, 23, 75,  3, 34};
  int row7[7]   = {88,  2, 77, 73,  7, 63, 67};
  int row8[8]   = {99, 65,  4, 28,  6, 16, 70, 92};
  int row9[9]   = {41, 41, 26, 56, 83, 40, 80, 70, 33};
  int row10[10] = {41, 48, 72, 33, 47, 32, 37, 16, 94, 29};
  int row11[11] = {53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14};
  int row12[12] = {70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57};
  int row13[13] = {91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48};
  int row14[14] = {63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31};
  int row15[15] = { 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23};
  int *data[ROWS] = {row1, row2, row3, row4, row5, 
                     row6, row7, row8, row9, row10,
                     row11, row12, row13, row14, row15};
  int i;
  for (i = ROWS; i > 0; --i) {
    int j;
/* we process the data from the bottom of the triangle and compute the maximum of adjacent 
values and add these maxima to the previous row and iterate */
    for (j=0; j < (i - 1); ++j)
      data[i-2][j] += max(data[i-1][j], data[i-1][j+1]);
  }
  printf("%d\n",data[0][0]);
  
  return 0;
}

int max(int left, int right)
{
  return right > left ? right : left;
}
