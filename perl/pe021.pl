#!/usr/bin/perl -w
use strict;

my $map;
for my $i (0 .. 9999) {
  $map->{$i} = sum_factors($i);
}

my $total;
while (my ($key, $value) = each %$map) {
  $total += $key if ((defined $map->{$value}) && ($key != $value) && ($map->{$value} == $key));
}
print $total,"\n";

sub sum_factors {
  my $number = shift;

  my $sum = 1;
  for (my $i = 2; $i <= sqrt($number); $i++) {
    if (!($number % $i)) {
      $sum += ($i + ($number / $i));
    }
  }
  return $sum;
}
  
