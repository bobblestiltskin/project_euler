#!/usr/bin/tclsh

set total 0
set max 4000000
set previous 1
set current 1

while {$current < $max} {
  set next [expr $previous + $current]
  if {$current % 2 == 0} {
    incr total $current
  }
  set previous $current
  set current $next
}
puts $total
