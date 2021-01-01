#!/usr/bin/tclsh

set total 0
set max 1000

for {set i 0} {$i < $max} {incr i} {
 if {$i % 3 == 0 || $i % 5 == 0} {
    incr total $i
  }
}
puts $total
