#!/usr/bin/perl6

my @dpm = [ < 31 28 31 30 31 30 31 31 30 31 30 31 > ];
my @ldpm = [ < 31 29 31 30 31 30 31 31 30 31 30 31 > ];

my @cycle = [ |@dpm, |@dpm, |@dpm, |@ldpm ];

my $count = 0;
my $dow = 2; # start on tuesday 1901.1.1
for (0 .. 24) { # 2000 is a leap year too!
  for @cycle {
    $count++ if not $dow;
    $dow = ($dow + $_) % 7;
  }
}
say $count;
