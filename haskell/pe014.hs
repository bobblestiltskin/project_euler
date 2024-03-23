-- this computes projecteuler.net problem 014

collatz :: Int -> Int -> Int
collatz 1 length = length

collatz n length | n > 0 && (rem n 2 == 0) = collatz (div n 2) (length + 1)

collatz n length | n > 0 = collatz (3 * n + 1) (length + 1)

count_collatz :: Int -> Int -> Int -> Int
count_collatz n maxn maxc | n > 0 = 
  do
    let this_collatz = collatz n 0

    if this_collatz > maxc then
      count_collatz (n - 1) n this_collatz
    else
      count_collatz (n - 1) maxn maxc

count_collatz _ maxn _ = maxn

pe014 :: Int -> Int
pe014 a = count_collatz a 0 0

main = print(pe014 1000000)
