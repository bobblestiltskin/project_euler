#!/usr/bin/perl -w
use strict;

my $sumsq = 0;
foreach my $i (1 .. 100) {
  $sumsq += $i*$i;
}
print "SUMSQ is $sumsq\n";

my $sqsum = (101 * 50) ** 2;
print "SQSUM is $sqsum\n";
print "DIFFERENCE is ",$sqsum - $sumsq,"\n";
