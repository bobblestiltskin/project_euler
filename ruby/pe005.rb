#!/usr/bin/ruby

def is_prime(num)
  if num % 2 == 1
    if num < 8
      if num == 1
        return false
      else
        return true
      end
    else
      divisor = 3
      while divisor * divisor <= num
        if num % divisor == 0
          return false
        end
        divisor += 2
      end
      return true
    end
  else
    return num == 2
  end
end

MAX = 20
i = 2
try_product = true
total = 1
while i <= MAX
  if is_prime(i)
    if try_product
      if i * i > MAX
        try_product = false
      else
        tmp = i
        last = tmp
        while tmp <= MAX
          last = tmp
          tmp *= i
        end
        total *= last
      end
    end
    if !try_product
      total *= i
    end
  end
  i += 1
end
puts(total)
