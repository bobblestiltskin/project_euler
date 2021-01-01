#!/usr/bin/tclsh

set num 1
for {set i 1} {$i < 101} {incr i} {
  set num [expr $num * $i]
}

set sum 0
for {set i 0} {$i < [string length $num]} {incr i} {
  set charval [string range $num $i $i]
  set sum [expr $sum + $charval]
}
puts $sum
