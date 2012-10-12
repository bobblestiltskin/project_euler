#!/usr/bin/perl -w
use strict;

my $last = 500 >> 1;

my $num = 0;
my $i = 0;
my $j = 1;
while ($num < $last) {
  $i = $i + $j;
  $num = get_num_divisors($i);
  $j++;
}
print $i,"\n";

sub get_num_divisors {
  my $num = shift;

  my $counter = 0;
  my $running = 1;
  while ($running <= sqrt($num)) {
    $counter++ if (not ($num % $running));
    $running++;
  }
  return $counter;
}
