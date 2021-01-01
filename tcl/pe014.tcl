#!/usr/bin/tclsh

proc next_term { num } {
  if {$num % 2} {
    set num [expr 3 * $num + 1]
  } else {
    set num [expr $num >> 1]
  }
}

set last 1000000
set max 0
set maxi 0

for {set i 1} {$i < $last} {incr i} {
  set counter 0
  set j $i
  while {$j != 1} {
    set j [next_term $j]
    incr counter
  }
  incr counter
  if {$counter > $max} {
    set max $counter
    set maxi $i
  } 
}
puts $maxi
