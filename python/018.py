#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 018 """

  row1 = [75]
  row2 = [95, 64]
  row3 = [17, 47, 82]
  row4 = [18, 35, 87, 10]
  row5 = [20,  4, 82, 47, 65]
  row6 = [19,  1, 23, 75,  3, 34]
  row7 = [88,  2, 77, 73,  7, 63, 67]
  row8 = [99, 65,  4, 28,  6, 16, 70, 92]
  row9 = [41, 41, 26, 56, 83, 40, 80, 70, 33]
  row10 = [41, 48, 72, 33, 47, 32, 37, 16, 94, 29]
  row11 = [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14]
  row12 = [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57]
  row13 = [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48]
  row14 = [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31]
  row15 = [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]

  data = [row1, row2, row3, row4, row5, row6, row7, row8, row9,
          row10, row11, row12, row13, row14, row15]

# we process the data from the bottom of the triangle and compute the maximum of adjacent 
# values and add these maxima to the previous row and iterate
  for i in range(len(data), 0, -1):
    for j in range(i-1):
      data[i-2][j] += max(data[i-1][j], data[i-1][j+1]);

  print 'SUM is',data[0][0]

  return 0

def max(left, right):
  if (right > left):
    return right
  else:
    return left

if __name__ == "__main__":
    main()
