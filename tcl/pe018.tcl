#!/usr/bin/tclsh

proc max { left right } {
  if {$right > $left} {
    return $right
  } else {
    return $left
  }
}

set data [ list \
  [ list 75 ] \
  [ list 95 64 ] \
  [ list 17 47 82 ] \
  [ list 18 35 87 10 ] \
  [ list 20 04 82 47 65 ] \
  [ list 19 01 23 75 03 34 ] \
  [ list 88 02 77 73 07 63 67 ] \
  [ list 99 65 04 28 06 16 70 92 ] \
  [ list 41 41 26 56 83 40 80 70 33 ] \
  [ list 41 48 72 33 47 32 37 16 94 29 ] \
  [ list 53 71 44 65 25 43 91 52 97 51 14 ] \
  [ list 70 11 33 28 77 73 17 78 39 68 17 57 ] \
  [ list 91 71 52 38 17 14 91 43 58 50 27 29 48 ] \
  [ list 63 66 04 68 89 53 67 30 73 16 69 87 40 31 ] \
  [ list 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23 ] \
]


set newrow [list]
set lastrow [expr [llength $data] - 1]
set row [lindex $data $lastrow]
for {set row_index [llength $data]} {$row_index > 0} {incr row_index -1} {
  set ri [expr $row_index - 1]
# we process the data from the bottom of the triangle and compute the maximum of adjacent 
# values and add these maxima to the previous row and iterate
  for {set column_index 0} {$column_index < $ri} {incr column_index} {
    set left [expr [scan [lindex $row $column_index] %d]]
    set ci1 [expr $column_index + 1]
    set right [expr [scan [lindex $row $ci1] %d]]
    set rim1 [expr $ri - 1]
    set orig [expr [scan [lindex [lindex $data $rim1] $column_index] %d]]
    set lorr [max $left $right]
    incr orig $lorr
    lappend newrow $orig
    set val $newrow
  }
  set row $newrow
  set newrow [list]
}
puts $val
