#!/usr/bin/tclsh

set MAX3 999
set MIN3 100
set maxp 0

set mini $MIN3
set minj $MIN3
set maxj $MAX3

for {set i $MAX3} {$i >= $mini} {incr i -1} {
  for {set j $maxj} {$j >= $minj} {incr j -1} {
    set product [expr $i * $j]
    set gnirts [string reverse $product]
    if {$gnirts == $product} {
      if {$product > $maxp} {
        set maxp $product
        set mini [expr $product / 1000]
        set minj $mini
      }
    }
  }
}
    
puts $maxp
