#!/usr/bin/tclsh

set units [ list one two three four five six seven eight nine]

set tens [ list \
ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen  \
twenty twentyone twentytwo twentythree twentyfour twentyfive twentysix twentyseven twentyeight twentynine  \
thirty thirtyone thirtytwo thirtythree thirtyfour thirtyfive thirtysix thirtyseven thirtyeight thirtynine  \
forty fortyone fortytwo fortythree fortyfour fortyfive fortysix fortyseven fortyeight fortynine  \
fifty fiftyone fiftytwo fiftythree fiftyfour fiftyfive fiftysix fiftyseven fiftyeight fiftynine  \
sixty sixtyone sixtytwo sixtythree sixtyfour sixtyfive sixtysix sixtyseven sixtyeight sixtynine  \
seventy seventyone seventytwo seventythree seventyfour seventyfive seventysix seventyseven seventyeight seventynine  \
eighty eightyone eightytwo eightythree eightyfour eightyfive eightysix eightyseven eightyeight eightynine  \
ninety ninetyone ninetytwo ninetythree ninetyfour ninetyfive ninetysix ninetyseven ninetyeight ninetynine  \
]

set hcount 7
set handcount 10

set count 0
foreach unit $units {
  set slu [string length $unit]
  set unit_hash($unit) $slu
  incr count $slu
}

foreach ten $tens {
  set slt [string length $ten]
  set ten_hash($ten) $slt
  incr count $slt
}

foreach unit $units {
  set count [expr $count + $unit_hash($unit) + $hcount]
  foreach item  [array names unit_hash *] {
    set count [expr $count + $unit_hash($unit) + $handcount + $unit_hash($item)]
  }
  foreach item  [array names ten_hash *] {
    set count [expr $count + $unit_hash($unit) + $handcount + $ten_hash($item)]
  }
}
set onek "one thousand"
set count [expr $count + [string length $onek] - 1]
puts $count
