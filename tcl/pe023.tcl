#!/usr/bin/tclsh

proc sum_factors { number } {
  set sum 1
  set nsqrt [expr sqrt($number)]
  for {set i 2} {$i <= $nsqrt} {incr i} {
    if {$number % $i == 0} {
      set divisor [expr $number / $i]
      incr sum $i
      if {$i != $divisor} {
        incr sum $divisor
      }
    }
  }
  return $sum
}

set alist [list]

set sum 0
set max 28123

for {set i 1} {$i <= $max} {incr i} {
  set sf [sum_factors $i]
  if {$i < $sf} {
    lappend alist $i
    array set ahash [list $i $sf]
  }
}

set last [lindex $alist 0]
for {set i 0} {$i < $last} {incr i} {
  incr sum $i
}

for {set i $last} {$i < $max} {incr i} {
  set addi true
  foreach j $alist {
    if {$i > $j} {
      set diff [expr $i - $j]
      foreach index [array names ahash $diff] {
        if {$index == $diff} {
          if {$ahash($diff)} {
            set addi false
          }
        }
      }
    }
  }
  if {$addi} {
    incr sum $i
  }
}

puts $sum
