#!/usr/bin/ruby

f = File.open('../names.txt', 'r')
name_string = f.read

names = []
start = 1
(0 ... name_string.length - 3).each do |i|
  if name_string[i] == '"'
    if name_string[i+1] == ','
      if name_string[i+2] == '"'
        name = name_string[start .. i - 1]
        names.push(name)
        start = i + 3
      end
    end
  end
end

name = name_string[start .. name_string.length - 2]
names.push(name)
names = names.sort

total = 0
(0 .. names.length - 1).each do |i|
  letters = 0
  name = names[i]
  name.split('').each do |letter|
    letters += letter.ord - 64
  end
  total += letters * (i+1)
end

puts(total)
