#!/usr/bin/tclsh

set stop 1000

for {set i 1} {$i < $stop} {incr i} {
  for {set j [expr $i + 1]} {$j < $stop} {incr j} {
    for {set k [expr $j + 1]} {$k < $stop} {incr k} {
      if {[expr $i + $j + $k] == $stop && [expr $i * $i + $j * $j ] == [expr $k * $k]} {
        set total [expr $i * $j * $k]
        puts $total
        exit 0
      }
    }
  }
}
exit 1
