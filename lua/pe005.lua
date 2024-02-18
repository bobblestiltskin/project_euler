-- this computes projecteuler.net problem 005
local function isprime(num)
  if num % 2 == 1 then
    if num < 8 then
      if num == 1 then
        return false
      else
        return true
      end
    else
      divisor = 3
      while divisor * divisor <= num do
        if num % divisor == 0 then
          return false
	end
        divisor = 2 + divisor
      end
      return true
    end
  else
    return num == 2
  end
end

local MAX=20
local i = 2
local try_product = true
local total = 1

while i <= MAX do
  if isprime(i) then
    if try_product then
      if i * i > MAX then
        try_product = false
      else
        tmp = i
        last = tmp
        while tmp <= MAX do
          last = tmp
          tmp = i * tmp
	end
        total = last * total
      end
    end
    if not try_product then
      total = i * total
    end
  end
  i = 1 + i
end
print(total)
