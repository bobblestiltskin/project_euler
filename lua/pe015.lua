-- this computes projecteuler.net problem 015 

-- need to compute 2n!/((n!)*(n!))

local limit = 20
local numerator = {}
local denominator = {}

for i = 1, limit do
  denominator[i] = i
  numerator[i] = i+limit
end

--  walk through lists and cast away multiples to reduce size of numbers from
--  factorials - this is incomplete factoring but sufficient for this problem
--  we could factor both completely if we wanted...

for i = 1, limit do
  for j = 1, limit do
    local d = denominator[i]
    local n = numerator[j]
    if d ~= 1 and (n % d) == 0 then
        numerator[j] = math.floor(n / d)
        denominator[i] = 1
    end
  end
end

local num = 1
local denom = 1
for i = 1, limit do
  num = numerator[i] * num
  denom = denominator[i] * denom
end
      
print(math.floor(num/denom))
