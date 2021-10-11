#!/usr/bin/ruby

STOP = 1000

(0 ... STOP).each do |a|
  (a+1 ... STOP).each do |b|
    (b+1 ... STOP).each do |c|
      if a + b + c == STOP
        if a*a + b * b == c*c
          puts(a * b * c)
          exit
        end
      end
    end
  end
end
