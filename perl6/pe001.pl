#!/usr/bin/perl6

my $total = 0;
my $max = 1000;

loop (my $i=1; $i < $max; $i++) {
  $total += $i if (!($i % 3) or !($i % 5));
}
say $total;
