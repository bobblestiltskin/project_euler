-- this computes projecteuler.net problem 016
import Data.Char

base :: Int
base = 10

reverse_list :: [a] -> [a]
reverse_list []     = []
reverse_list (x:xs) =  reverse_list xs ++ [x]

multiply_with_carry :: Int -> Int -> Int -> Int
multiply_with_carry x n carry = (x * n) + carry
 
mul_digit_string :: Int -> String -> Int -> String -> String
mul_digit_string 0 ins _ outs = "0"
mul_digit_string 1 ins _ outs = ins
mul_digit_string _ [] 0 outs = outs
mul_digit_string _ [] carry outs = (show carry) ++ outs
mul_digit_string n ins carry outs =
  do
    let rs = reverse_list ins
    let p = multiply_with_carry (digitToInt (head rs)) n carry
    let newcarry = quot p base
    let newout = show(mod p base) ++ outs
    mul_digit_string n (reverse_list(tail rs)) newcarry newout

sum_digits :: [Char] -> Int -> Int
sum_digits []     sum = sum
sum_digits (x:xs) sum = sum_digits xs (sum + digitToInt x)

power_string:: Int -> String -> String
power_string 0 str = str
power_string n str = power_string (n - 1) (mul_digit_string 2 str 0 "" )

pe016 :: Int -> Int
pe016 n = sum_digits (power_string n "1") 0

main = print(pe016 1000)
