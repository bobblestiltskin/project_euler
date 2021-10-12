#!/usr/bin/ruby

row1 = Array[75]
row2 = Array[95, 64]
row3 = Array[17, 47, 82]
row4 = Array[18, 35, 87, 10]
row5 = Array[20,  4, 82, 47, 65]
row6 = Array[19,  1, 23, 75,  3, 34]
row7 = Array[88,  2, 77, 73,  7, 63, 67]
row8 = Array[99, 65,  4, 28,  6, 16, 70, 92]
row9 = Array[41, 41, 26, 56, 83, 40, 80, 70, 33]
row10 = Array[41, 48, 72, 33, 47, 32, 37, 16, 94, 29]
row11 = Array[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14]
row12 = Array[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57]
row13 = Array[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48]
row14 = Array[63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31]
row15 = Array[ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]

data = Array[row1, row2, row3, row4, row5, row6, row7, row8, row9,
          row10, row11, row12, row13, row14, row15]

# we process the data from the bottom of the triangle and compute the maximum of adjacent 
# values and add these maxima to the previous row and iterate
data.length.downto(0).each do |i|
  (0 ... i - 1).each do |j|
    data[i-2][j] += [data[i-1][j], data[i-1][j+1]].max
  end
end

puts(data[0][0])
