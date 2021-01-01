#!/usr/bin/tclsh

set sumsq 0
set max 100

for {set i 0} {$i <= $max} {incr i} {
  set isquared [expr $i * $i]
  incr sumsq $isquared
}

set prod [expr {101 * 50}]
set sqsum [expr $prod * $prod]
set diff [expr $sqsum - $sumsq]

puts $diff
