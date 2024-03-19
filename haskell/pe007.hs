is_prime_try :: Int -> Int -> Bool

is_prime_try _ 1                      = True
is_prime_try n try | n `rem` try == 0 = False
is_prime_try n try                    = is_prime_try n (try - 1)

is_prime :: Int -> Bool
is_prime n = do
  let x = floor (sqrt (fromIntegral n))
  is_prime_try n x

count_primes :: Int -> Int -> Int -> Int
count_primes current index limit | index < limit =
  do
    let next = current + 2
    if is_prime current then
      count_primes next (index + 1) limit
    else
      count_primes next index limit

count_primes current _ _ = current - 2

pe007 :: Int -> Int
pe007 n = count_primes 3 1 n

main = print(pe007 10001)
