-- this computes projecteuler.net problem 023

import qualified Data.Map as Map

check_each_abundant_value :: Int -> [Int] -> Map.Map Int Int -> Int -> Int
check_each_abundant_value value (x:xs) mmap sum =
  do
    if x > value then
      check_each_abundant_value value [] mmap (sum + value)
    else
      if Map.member (value - x) mmap then
        check_each_abundant_value value [] mmap sum 
      else
        check_each_abundant_value value xs mmap sum 

check_each_abundant_value _ [] _ sum = sum

start_vals :: Int -> Int -> Int
start_vals x sum | x > 0 = start_vals (x - 1) (sum + x)
start_vals x sum = sum

check_each_value :: Int -> Int -> [Int] -> Map.Map Int Int -> Int -> Int
check_each_value n value list mmap sum | value < n = 
  do
    let new_sum = check_each_abundant_value value list mmap sum
    check_each_value n (value + 1) list mmap new_sum

check_each_value _ _ _ _ sum = sum

sum_factors :: Int -> Int -> Int -> Int -> Int
sum_factors n root count sum | count < root =
  do
    if rem n count == 0 then
      do
        let divisor = div n count
        if count == divisor then
          sum_factors n root (count + 1) (sum + count)
        else
          sum_factors n root (count + 1) (sum + count + divisor)
    else
      sum_factors n root (count + 1) sum

sum_factors _ _ _ sum = sum

compute_data :: Int -> Map.Map Int Int -> Map.Map Int Int
compute_data n mmap | n > 0 = 
  do
    let root = ceiling (sqrt ((fromIntegral n) + 1))
    let fsum = sum_factors n root 2 1

    if n < fsum then
      compute_data (n - 1) (Map.insert n fsum mmap)
    else
      compute_data (n - 1) mmap

compute_data _ mmap = mmap

pe023 :: Int -> Int
pe023 n = do
  let mmap = compute_data n Map.empty
  let keys = Map.keys mmap
  let first = head keys
  let start_sum = start_vals (first - 1) 0
  check_each_value n first keys mmap start_sum

main = print(pe023 28123)
