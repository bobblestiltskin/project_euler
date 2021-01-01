#!/usr/bin/tclsh

set max_key 10000
proc sum_factors { number } {
  set sum 1
  set nsqrt [expr sqrt($number)]
  for {set i 2} {$i <= $nsqrt} {incr i} {
    if {$number % $i == 0} {
      set sum [expr $sum + $i + $number / $i]
    }
  }
  return $sum
}

for {set i 0} {$i < $max_key} {incr i} {
  set map($i) [sum_factors $i]
}

set total 0
foreach item [array names map] {
  if {[array names map $item]} {
    if {$map($item) <= $max_key} {
      if {$item != $map($item)} {
        if {$map($map($item)) == $item} {
          incr total $item
        }
      }
    }
  }
}
puts $total
