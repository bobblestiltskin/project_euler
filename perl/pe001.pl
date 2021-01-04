#!/usr/bin/perl -w
use strict;

my $total = 0;

my $max = 1000;

foreach my $i (1 .. $max - 1) {
  $total += $i if (!($i % 3) or !($i % 5));
}
print $total,"\n";
