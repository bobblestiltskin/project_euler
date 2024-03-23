-- this computes projecteuler.net problem 015

list_product :: [Int] -> Int -> Int
list_product [] n = n
list_product (x:xs) n = list_product xs (x * n)

pe015 :: Int -> Int
pe015 n = 
  do
-- the top half of the lower set will have a corresponding double in the upper set i.e. 11 -> 20 
-- so we factorise by removing the upper half of the lower set and replacing the corresponding doubles by 2
    let a = [ 1 .. div n 2]
    let b = filter odd [ (n + 1) .. (n * 2)]
    let twos = [2,2,2,2,2,2,2,2,2,2]

    let x = list_product a 1
    let y = list_product b 1
    let t = list_product twos 1
    div (y * t) x

main = print(pe015 20)
