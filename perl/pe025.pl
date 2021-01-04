#!/usr/bin/perl -w
use strict;

use Math::BigInt;
use Memoize;
memoize('fib');

my $i = 0;
my $x = Math::BigInt->new;
while ($x->length() < 1000) {
  $i++;
  $x = Math::BigInt->new(fib($i));
}
print $i,"\n";

sub fib {
  my $i = shift;
  return $i if ($i < 2);
  return Math::BigInt->new(fib($i-2) + fib($i-1));
}
