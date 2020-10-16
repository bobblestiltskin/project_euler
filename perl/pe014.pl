#!/usr/bin/perl -w
use strict;

my $last = 1000000;
my $max = 0;
my $maxi = 0;
for (my $i = 1; $i < $last; $i++) {
  my $counter = 0;
  my $j = $i;
  while ($j != 1) {
    $j = next_term($j);
    $counter++;
  }
  $counter++;
  
  if ($counter > $max) {
    $max = $counter;
    $maxi = $i;
  }
}
print $maxi,"\n";

  
sub next_term {
  my $num = shift;

  my $retval = ($num % 2) ? $num + $num + $num + 1 : $num >> 1;
  return $retval;
}
