-- this computes projecteuler.net problem 014

first = 500000
last = 1000000
maxv = 0
maxi = 0

function next_term(num)
  if num % 2  == 1 then
    retval = num + num + num + 1
  else
    retval = num >> 1
  end
  return retval
end
  
--  for i in range(last >> 1, last):
for i = first, last do
  counter = 0
  j = i
  while j ~= 1 do
    j = next_term(j)
    counter = 1 + counter
  end
  counter = 1 + counter

  if counter > maxv then
    maxv = counter
    maxi = i
  end
end

print(maxi)
