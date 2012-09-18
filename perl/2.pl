#!/usr/bin/perl -w
use strict;

use Memoize;
memoize('fib');

my $total = 0;

my $max_fib = 4_000_000;

my $i = 0;
my $fib = fib($i);
while ($fib < $max_fib) {
print "I is $i and  FIB is $fib\n";
  $total += $fib if (!($fib  % 2));
  $i++;
  $fib = fib($i);
}
print "TOTAL is $total\n";

sub fib {
  my $i = shift;
  return $i if ($i < 2);
  return (fib($i-2) + fib($i-1));
}





