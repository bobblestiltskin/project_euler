-- this computes projecteuler.net problem 001
main = print ( sum [ x | x <- [0..999] , x `mod` 3 == 0 || x `mod` 5 == 0] )
