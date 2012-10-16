#!/usr/bin/perl -w
use strict;

#You are given the following information, but you may prefer to do some research for yourself.
#
#    1 Jan 1900 was a Monday.
#    Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

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
