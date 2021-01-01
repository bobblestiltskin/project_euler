#!/usr/bin/tclsh

set dpm [list 31 28 31 30 31 30 31 31 30 31 30 31]
set ldpm [list 31 29 31 30 31 30 31 31 30 31 30 31]

set cycle [ list $dpm $dpm $dpm $ldpm]

set count 0
set dow 2
set max 25

for {set i 0} {$i < $max} {incr i} {
  foreach year $cycle {
    foreach mdays $year {
      if {$dow == 0} {
        incr count
      }
      set sum [expr $dow + $mdays]
      set dow [expr $sum % 7]
    }
  }
}
puts $count
