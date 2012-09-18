#!/usr/bin/perl -w
use strict;

(@ARGV == 1) or die "Need a number to stop at, $!";
my $last = $ARGV[0];
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
  
  print "I is $i and COUNTER is ",$counter,"\n";
  if ($counter > $max) {
    $max = $counter;
    $maxi = $i;
  }
}
print "IMAX is $maxi and MAX is ",$max,"\n";

  
sub next_term {
  my $num = shift;

#print "NUM is $num\n";
  my $retval = ($num % 2) ? $num + $num + $num + 1 : $num >> 1;
#print "RETVAL is $retval\n";
  return $retval;
}
