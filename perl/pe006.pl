#!/usr/bin/perl -w
use strict;

my $sumsq = 0;
foreach my $i (1 .. 100) {
  $sumsq += $i*$i;
}

my $sqsum = (101 * 50) ** 2;
print $sqsum - $sumsq,"\n";
