#!/usr/bin/tclsh

set limit 20

# need to compute 2n!/((n!)*(n!))

set numerator [list]
set denominator [list]
for {set i 0} {$i < $limit} {incr i} {
  lappend numerator [expr $i + $limit + 1]
  lappend denominator [expr $i + 1]
}

#  walk through lists and cast away multiples to reduce size of numbers from
#  factorials - this is incomplete factoring but sufficient for this problem
#  we could factor both completely if we wanted...

foreach i $denominator {
  foreach j $numerator {
    if {$i != 1} {
      set mod [expr $j % $i]
      if {$mod == 0} {
        set j [expr $j / $i]
        set i 1
      }
    }
  }
}
set num 1
set denom 1
for {set i 0} {$i < $limit} {incr i} {
  set num [expr [lindex $numerator $i] * $num]
  set denom [expr [lindex $denominator $i] * $denom]
}
puts [expr $num / $denom]
