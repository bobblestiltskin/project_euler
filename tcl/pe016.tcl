#!/usr/bin/tclsh

set x 2
set y 1000

set total 1
for {set i 0} {$i < $y} {incr i} {
  set total [expr $total * 2]
}

set sum 0
for {set i 0} {$i < [string length $total]} {incr i} {
  set charval [string range $total $i $i]
  set sum [expr $sum + $charval]
}
puts $sum
