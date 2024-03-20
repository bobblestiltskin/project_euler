-- this computes projecteuler.net problem 009
equal_sum :: Int -> Int -> Int -> Int -> Bool
equal_sum n a b c = n == a + b + c

equal_squares :: Int -> Int -> Int -> Bool
equal_squares a b c = a * a + b * b == c * c

both_match :: Int -> Int -> Int -> Int -> Bool
both_match n a b c = equal_sum n a b c && equal_squares a b c

pythagoran_triplet :: Int -> Int -> Int -> Int -> Int
pythagoran_triplet n a b c | c < n =
  if both_match n a b c then
    a * b * c
  else
    pythagoran_triplet n a b (c + 1)

pythagoran_triplet n a b c | b < n =
  if both_match n a b c then
    a * b * c
  else
    pythagoran_triplet n a (b + 1) 1

pythagoran_triplet n a b c | a < n =
  if both_match n a b c then
    a * b * c
  else
    pythagoran_triplet n (a + 1) 1 1

pe009 :: Int -> Int
pe009 n = pythagoran_triplet n 1 2 3

main = print(pe009(1000))
