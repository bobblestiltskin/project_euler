-- this computes projecteuler.net problem 004

local MAX3 = 999
local MIN3 = 100
local maxp = 0

local mini = MIN3
local minj = MIN3
local maxj = MAX3

local product = 0

local function is_palindromic(digits)
  slen = string.len(digits)

  for i = 1, slen - 1 do
    if string.byte(digits, i) ~= string.byte(digits, -i) then
      return false
    end
  end

  return true
end
  
for i = MAX3, mini, -1 do
  for j = maxj, minj, -1 do
    product = i * j
    if is_palindromic(tostring(product)) then
      if product > maxp then
        maxp = product
        -- minj = product 
        mini = product -- 1000
      end
    end
  end
  maxj = i
end

print(maxp)
