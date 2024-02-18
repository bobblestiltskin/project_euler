-- this computes projecteuler.net problem 010

local last = 2000000;
local primes = {2}
local pcount = 1

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

local psum = 2

--for test in range(3, last, 2):
for test = 3, last, 2 do
  if is_prime(test, primes) then
      pcount = pcount + 1
      primes[pcount] = test
      psum = test + psum
  end
end

print(psum)
