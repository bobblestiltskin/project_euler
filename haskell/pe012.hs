-- this computes projecteuler.net problem 012
get_number_of_divisors :: Int -> Int -> Int -> Int -> Int
get_number_of_divisors n root running num_divisors | running < root =
    if rem n running == 0 then
      get_number_of_divisors n root (running + 1) (num_divisors + 1)
    else
      get_number_of_divisors n root (running + 1) num_divisors

get_number_of_divisors _ _ _ num_divisors = num_divisors

triangle_number :: Int -> Int -> Int -> Int -> Int
triangle_number n last i j | n < last =
  do
    let root = floor (sqrt (fromIntegral (i + j)))
    triangle_number (get_number_of_divisors (i + j) root 1 0) last (i + j) (j + 1)

triangle_number _ _ i _ = i

pe012 :: Int -> Int
pe012 n = triangle_number 0 (div n 2) 0 1

main = print(pe012 500)
