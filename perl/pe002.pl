#!/usr/bin/perl -w
use strict;

my $total = 0;
my $max = 4000000;
my $previous = 1;
my $current = 1;
while ($current < $max) {
  my $next = $previous + $current;
  $total += $current if (!($current % 2));
  $previous = $current;
  $current = $next;
}
print "$total\n";
