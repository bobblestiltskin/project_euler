-- this computes projecteuler.net problem 020
import Data.Char

mysum :: String -> Int -> Int
mysum [] n = n
mysum (x:xs) n = mysum xs (digitToInt(x) + n)

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

pe020:: Integer -> Int
pe020 n = mysum (show (factorial n)) 0

main = print(pe020 100)
