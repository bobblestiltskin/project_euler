#!/usr/bin/tclsh

proc is_prime_in_list { test primelist } {
  set root [ expr sqrt($test) ]
  foreach num $primelist {
    if {$num > $root} {
      return true
    }
    if { [expr $test % $num] == 0 } {
      return false
    }
  }
}

set last 2000000
set sum 2
set primes [list 2]
set test 5
for {set test 3} {$test < $last} {incr test 2} {
  if { [ is_prime_in_list $test $primes ] } {
    lappend primes $test
    incr sum $test
  }
}
puts $sum
