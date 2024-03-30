-- this computes projecteuler.net problem 025

fibonacci_digits :: Integer -> Integer -> Int -> Int -> Int -> Int
-- we use Integers for previous and current, the fibonacci terms because 1000 digit integers...
fibonacci_digits previous current n len index | len < (fromIntegral n) = fibonacci_digits current (previous + current) n (length(show current)) (index + 1)
fibonacci_digits _ _ _ _ index = index

pe025 :: Int -> Int
pe025 n = fibonacci_digits 1 1 n 0 1

main = print(pe025 1000)
