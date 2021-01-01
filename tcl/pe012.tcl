#!/usr/bin/tclsh

proc get_num_divisors { num } {
  set counter 0
  set running 1
  set rootnum [expr sqrt($num)]
  while {$running <= $rootnum} {
    if {[expr $num % $running] == 0} {
      incr counter
    }
    incr running
  }
  return $counter
}

set num 0
set last 250
set i 0
set j 1
while {$num < $last} {
  incr i $j
  set num [get_num_divisors $i]
  incr j
}
puts $i
