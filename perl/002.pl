#!/usr/bin/perl -w
use strict;

use Memoize;
memoize('fib');

my $total = 0;

my $max = 4000000;

my $i = 0;
my $fib = fib($i);
while ($fib < $max) {
  $total += $fib if (!($fib  % 2));
  $i++;
  $fib = fib($i);
}
print "$total\n";

sub fib {
  my $i = shift;
  return $i if ($i < 2);
  return (fib($i-2) + fib($i-1));
}





