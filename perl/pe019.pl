#!/usr/bin/perl -w
use strict;

my $dpm = [ qw( 31 28 31 30 31 30 31 31 30 31 30 31 ) ];
my $ldpm = [ qw( 31 29 31 30 31 30 31 31 30 31 30 31 ) ];

my $cycle = [ $dpm, $dpm, $dpm, $ldpm ];

my $count = 0;
my $dow = 2; # start on tuesday 1901.1.1
foreach (0 .. 24) { # 2000 is a leap year too!
  for my $year (@$cycle) {
    foreach my $mdays (@$year) {
      $count++ if not $dow;
      $dow = ($dow + $mdays) % 7;
    }
  }
}
print $count,"\n";
