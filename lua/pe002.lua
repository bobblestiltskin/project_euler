-- this computes projecteuler.net problem 002
limit = 4000000
total = 0
previous = 1
current = 1
while current < limit do
    next = current + previous
    if current % 2 == 0 then
      total = total + current 
    end
    previous = current
    current = next
end

print(total)
