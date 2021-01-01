#!/usr/bin/tclsh

set names_file [open "../names.txt"]
set all_names [read $names_file]
close $names_file

set names [split $all_names ,]
set total 0
set index 1
foreach name [lsort $names] {
  set name [string range $name 1 [expr [string length $name] - 2]]
  set sum 0
  for {set i 0} {$i < [string length $name]} {incr i} {
    set letter [string range $name $i $i]
    binary scan $letter c1 myint
    incr sum $myint
    incr sum -64
  }
  incr total [expr $sum * $index]
  incr index
}
puts $total
