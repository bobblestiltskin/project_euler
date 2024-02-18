-- this computes projecteuler.net problem 007

local function is_prime(test, primes) 
  root = math.sqrt(test)

  for i, prime in ipairs(primes) do
    if prime > root then
      return true
    end
    if (test % prime) == 0 then
      return false
    end
  end
end

local primenum = 10001
local primes = {2,3}

local test = 5
local counter = 3
while counter <= primenum do
  if is_prime(test, primes) then
    primes[counter] = test
    counter = 1 + counter
  end
  test = 2 + test
end

print(primes[counter - 1])
