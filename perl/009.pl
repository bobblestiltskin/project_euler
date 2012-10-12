#!/usr/bin/perl -w
use strict;

my $stop = 1000;
for (my $a = 1; $a < $stop; $a++) {
  for (my $b = $a + 1; $b < $stop; $b++) {
    for (my $c = $b + 1; $c < $stop; $c++) {
      if ((($a + $b +$c) == $stop) and (($a * $a) + ($b * $b) == ($c * $c))) {
        print $a*$b*$c,"\n";
        exit(0);
      }
    }
  }
}
exit(1);
