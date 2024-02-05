-- this computes projecteuler.net problem 004

MAX3 = 999
MIN3 = 100
maxp = 0

mini = MIN3
minj = MIN3
maxj = MAX3

product = 0

function is_palindromic(digits)
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
