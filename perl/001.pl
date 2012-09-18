#!/usr/bin/perl -w
use strict;

my $total = 0;

(@ARGV == 1) or die "Need MAX as argument, $!";
my $max = $ARGV[0];

foreach my $i (1 .. $max - 1) {
  $total += $i if (!($i % 3) or !($i % 5));
}
print "MAX is $max and TOTAL is $total\n";
