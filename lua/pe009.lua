-- this computes projecteuler.net problem 009

stop = 1000
for a = 1,stop do
  for b = a+1,stop do
    for c = b+1,stop do
      if a+b+c == stop then
        if (a*a)+(b*b) == (c*c) then
          print(a*b*c)
	  os.exit(0)
	end
      end
    end
  end
end
os.exit(1)
