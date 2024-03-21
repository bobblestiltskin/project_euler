-- this computes projecteuler.net problem 010
is_prime_try :: Int -> Int -> Bool

is_prime_try _ 1                      = True
is_prime_try n try | n `rem` try == 0 = False
is_prime_try n try                    = is_prime_try n (try - 1)

is_prime :: Int -> Bool
is_prime n = do
  let x = floor (sqrt (fromIntegral n))
  is_prime_try n x

pe010 :: Int -> Int
pe010 n = sum [ x | x <- [2 .. n] , is_prime x ]

main = print(pe010 2000000)
