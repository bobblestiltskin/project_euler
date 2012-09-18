#!/usr/bin/perl -w
use strict;

(@ARGV == 1) or die "Need a number to count to, $!";
my $last = $ARGV[0] >> 1; # halve the count

my $num = 0;
my $i = 0;
my $j = 1;
while ($num < $last) {
  $i = $i + $j;
  $num = get_num_divisors($i);
  $j++;
  print "I is $i and J is ",$j," and NUM is $num\n";
}
print "I is $i and J is ",--$j," and NUM is $num\n";

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
