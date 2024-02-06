-- this computes projecteuler.net problem 006

sumsq = 0
for i = 1, 100 do
  sumsq = i * i + sumsq
end

sum = (101 * 50)
sqsum = sum * sum
  
print(sqsum - sumsq)
