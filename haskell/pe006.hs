-- this computes projecteuler.net problem 006
isum :: Int -> Int -> Int
isum n total | n > 0 = isum (n - 1) (total + n)
isum _ total         = total

square_sum :: Int -> Int
square_sum n =
  do
    let x = isum n 0
    x * x

sum_squares :: Int -> Int -> Int
sum_squares n isum | n > 0 = sum_squares (n - 1) (isum + (n * n))
sum_squares _ isum         = isum

pe006 :: Int -> Int
pe006 n = square_sum n - sum_squares n 0

main = print(pe006 100)
