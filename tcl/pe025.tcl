#!/usr/bin/tclsh

# Define the classic recursive procedure to find the
# n’th position in a Fibonacci series.
proc fib {num} {
  global fibo
  if {$num <= 2} {return 1}
  return [expr $fibo([expr $num - 1]) + $fibo([expr $num - 2])]
}

set i 0
set x ""
while {[string length $x] < 1000} {
  incr i
  set x [fib $i]
  set fibo($i) $x
}
puts $i
