-- this computes projecteuler.net problem 023

MAX = 28123
abundant = {}
adictionary = {}

function sum_factors(number)
  total = 1
  last = math.floor(math.sqrt(number))
  for i = 2, last do
    if (number % i) == 0 then
      divisor = math.floor(number / i)
      total = i + total
      if divisor ~= i then
	total = divisor + total
      end
    end
  end
  return total 
end

function table_contains_key(set, key)
    return set[key] ~= nil
end

abundant_count = 0
for i = 1, MAX do
  fsum = sum_factors(i)
  if i < fsum then
    abundant_count = abundant_count + 1
    abundant[abundant_count] = i
    adictionary[i] = fsum
  end
end

asum = 0
for i = 1, abundant[1] - 1 do
  asum = i + asum
end

for i = abundant[1], MAX do
  addi = true
  for j = 1, abundant_count do
    if abundant[j] < i then
      diff = i - abundant[j]
      if table_contains_key(adictionary, diff) then
        addi = false
        break
      end
    end
  end
  if addi then
    asum = i + asum
  end
end

print(asum)
