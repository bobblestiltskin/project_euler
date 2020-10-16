#!/usr/bin/perl6

use lib '../../perl6-memoize/lib/';
use Memoize;

my $i = 0;
my $x = 0;
while ($x.chars < 1000) {
  $i++;
  $x = fib($i);
}
say $i;

sub fib (Int $i where $_ >= 0) is memoized(:cache_size(10000), :cache_strategy("LRU")) {
  return $i if ($i < 2);
  return (fib($i-2) + fib($i-1));
}
