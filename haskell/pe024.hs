-- this computes projecteuler.net problem 024

import Data.List

sum_permutations :: Int -> Int -> Int -> Int
sum_permutations n count current | n > count =
  do
    let cstring = show current

    if isInfixOf "0" cstring && isInfixOf "1" cstring && isInfixOf "2" cstring && isInfixOf "3" cstring && isInfixOf "4" cstring && isInfixOf "5" cstring && isInfixOf "6" cstring && isInfixOf "7" cstring && isInfixOf "8" cstring && isInfixOf "9" cstring then
      sum_permutations n (count + 1) (current + 1)
    else
      sum_permutations n count (current + 1)

sum_permutations _ _ current = current - 1

pe024 :: Int -> Int
pe024 n = sum_permutations n (725760 + 241920 + 30240) 2780000000

main = print(pe024 1000000)
