-- this computes projecteuler.net problem 005
is_prime_try :: Int -> Int -> Bool

is_prime_try _ 1                      = True
is_prime_try n try | n `rem` try == 0 = False
is_prime_try n try                    = is_prime_try n (try - 1)

is_prime :: Int -> Bool
is_prime n = do
  let x = floor (sqrt (fromIntegral n))
  is_prime_try n x

power_less_than :: Int -> Int -> Int -> Int
power_less_than n p maxi =
  do
    let product = n * p
    if product > maxi then
      p
    else
      power_less_than n product maxi

lowest_common_multiple :: Int -> Int -> Int -> Int
lowest_common_multiple n maxi product | n > 1 = 
  if is_prime n then
    do 
      let x = power_less_than n 1 maxi
      lowest_common_multiple (n - 1) maxi (product * x)
  else
    lowest_common_multiple (n - 1) maxi product 

lowest_common_multiple _ _ product = product

pe005 :: Int -> Int
pe005 n = lowest_common_multiple n n 1

main = print(pe005 20)
