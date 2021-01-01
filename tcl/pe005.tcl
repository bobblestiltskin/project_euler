#!/usr/bin/tclsh

proc isprime { num } {
  if {$num % 2 == 1} {
    if {$num < 8} {
      if {$num == 1} {
        return false
      } else {
        return true
      }
    } else {
      set divisor 3
      while {[expr $divisor * $divisor] <= $num} {
        if {$num % $divisor == 0} {
          return false
        } else {
          incr divisor 2
        }
      }
      return true
    }
  } else {
    if {$num == 2} {
      return true
    } else {
      return false
    }
  }
}

set i 2
set max 20
set try_product true
set total 1
while {$i <= $max} {
  if { [ isprime $i ] } {
    if {$try_product} {
      if {[expr $i * $i] > $max} {
        set try_product false
      } else {
        set tmp $i
        set last $tmp
        while {$tmp <= $max} {
          set last $tmp
          set tmp [expr $tmp * $i]
        }
        set total [expr $total * $last]
      }
      if {!$try_product} {
        set total [expr $total * $i]
      }
    }
  }
  incr i
  set try_product true
}

puts $total
