-- this computes projecteuler.net problem 021

import qualified Data.Map as Map
import Data.Maybe

sum_divisors :: Int -> Int -> Int -> Int
sum_divisors n max sum | max > 1 =
  do
    if (n `rem` max) == 0 then
      sum_divisors n (max - 1) (sum + max + (n `div` max))
    else
      sum_divisors n (max - 1) sum

sum_divisors _ _ sum = sum

compute_amicable :: Int -> Map.Map Int Int -> Map.Map Int Int 
compute_amicable n amicable | n > 0 =
  do
    let iroot = floor (sqrt (fromIntegral n))
    let tmp = sum_divisors n iroot 1
    let new_amicable = Map.insert n tmp amicable
    compute_amicable (n - 1) new_amicable

compute_amicable _ amicable = amicable

sum_amicable :: Int -> Int -> Map.Map Int Int -> Int
sum_amicable n sum amicable | n > 0 =
  do
    if Map.member n amicable then
      do
        let x = fromMaybe 10001 (Map.lookup n amicable)
        let y = fromMaybe 10001 (Map.lookup x amicable)
        
        if x /= n && y == n then
          sum_amicable (n - 1) (sum + n) amicable
        else
          sum_amicable (n - 1) sum amicable
    else
      10002

sum_amicable _ sum _ = sum

pe021 :: Int -> Int
pe021 n = sum_amicable n 0 (compute_amicable n Map.empty)

main = print(pe021 10000)
