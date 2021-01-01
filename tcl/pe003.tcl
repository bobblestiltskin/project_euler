#!/usr/bin/tclsh

set number 600851475143
set max_prime 0
set i 3

while {$number != 1} {
  if {$number % $i == 0} {
    set max_prime $i
    set number [expr $number / $i]
  } else {
    incr i 2
  }
}
puts $max_prime
