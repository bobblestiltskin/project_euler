-- this computes projecteuler.net problem 007

function is_prime(test, primes) 
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

primenum = 10001
primes = {}
primes[1] = 2
primes[2] = 3

test = 5
counter = 3
while counter <= primenum do
  if is_prime(test, primes) then
    primes[counter] = test
    counter = 1 + counter
  end
  test = 2 + test
end

print(primes[counter - 1])
