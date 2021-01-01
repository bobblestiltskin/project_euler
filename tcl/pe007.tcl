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

set last 10001
set primes [list 2 3]
set test 5
while {[llength $primes] < $last} {
  if { [ is_prime_in_list $test $primes ] } {
    lappend primes $test
    set plen [llength $primes]
  }
  incr test 2
}
set last_index [llength $primes]
incr last_index -1
set last_value [lindex $primes $last_index]
puts $last_value
