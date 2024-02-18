-- this computes projecteuler.net problem 018 

local row1 = {75}
local row2 = {95, 64}
local row3 = {17, 47, 82}
local row4 = {18, 35, 87, 10}
local row5 = {20,  4, 82, 47, 65}
local row6 = {19,  1, 23, 75,  3, 34}
local row7 = {88,  2, 77, 73,  7, 63, 67}
local row8 = {99, 65,  4, 28,  6, 16, 70, 92}
local row9 = {41, 41, 26, 56, 83, 40, 80, 70, 33}
local row10 = {41, 48, 72, 33, 47, 32, 37, 16, 94, 29}
local row11 = {53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14}
local row12 = {70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57}
local row13 = {91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48}
local row14 = {63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31}
local row15 = { 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23}

local data = {row1, row2, row3, row4, row5, row6, row7, row8, row9,
        row10, row11, row12, row13, row14, row15}
local len_data = 15

-- we process the data from the bottom of the triangle and compute the maximum of adjacent 
-- values and add these maxima to the previous row and iterate
for i = len_data + 1, 3, -1 do
  for j = 1, i-2 do
    data[i-2][j] = math.max(data[i-1][j], data[i-1][j+1]) + data[i-2][j]
  end
end

print(data[1][1])
