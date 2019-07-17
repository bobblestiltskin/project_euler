#!/usr/bin/perl -w
use strict;

my $stop = 1000;
loop (my $a = 1; $a < $stop; $a++) {
  loop (my $b = $a + 1; $b < $stop; $b++) {
    loop (my $c = $b + 1; $c < $stop; $c++) {
      if ((($a + $b +$c) == $stop) and (($a * $a) + ($b * $b) == ($c * $c))) {
        say $a*$b*$c;
        exit(0);
      }
    }
  }
}
exit(1);
