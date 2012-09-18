#!/usr/bin/perl -w
use strict;

my $start = 123456789;
my $end = 9876543210;

my $count = 0;
for ($start .. $end) {
  my $num = sprintf("%010d", $_);
  next unless ($num =~ /0/);
  next unless ($num =~ /1/);
  next unless ($num =~ /2/);
  next unless ($num =~ /3/);
  next unless ($num =~ /4/);
  next unless ($num =~ /5/);
  next unless ($num =~ /6/);
  next unless ($num =~ /7/);
  next unless ($num =~ /8/);
  next unless ($num =~ /9/);
  $count++;
print "FOUND $_\n";
  last if ($count == 1000000);
}
print "COUNT is $count\n";
