#!/usr/bin/tclsh

#  9! is 362880 so after all the 10 digit numbers which 
#  start with 0 or 1 we will have passed 725760 of the 
#  combinations. The millionth combination will start
#  with a 2, since we need to count 274240 more combinations
#  after 2000000000.
#
#  8! is 40320, so there are that many 10 digit combinations starting 20.
#  The combination starting 22 is invalid (since the numerals must be
#  distinct), so we could count 6 sets of combinations of 40320 up to
#  2700000000 and then we would have seen 725760+241920 leaving 32320 to
#  find.
#
#  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
#  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

set start 2780000000
set end   9876543211
set count [expr 725760 + 241920 + 30240]

set lasti 0
for {set i $start} {$i < $end} {incr i} {
  if {[string match "*0*" $i]} {
    if {[string match "*1*" $i]} {
      if {[string match "*2*" $i]} {
        if {[string match "*3*" $i]} {
          if {[string match "*4*" $i]} {
            if {[string match "*5*" $i]} {
              if {[string match "*6*" $i]} {
                if {[string match "*7*" $i]} {
                  if {[string match "*8*" $i]} {
                    if {[string match "*9*" $i]} {
                      if {$count < 1000000} {
                        incr count
                        set lasti $i
                      } else {
                        break
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
puts $lasti
