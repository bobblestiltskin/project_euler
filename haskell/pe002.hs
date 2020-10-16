fibonacci :: ( Integral a ) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n - 1) + fibonacci(n - 2)

main = print(sum (takeWhile (<4000000) (filter even (map fibonacci [1..]))))
