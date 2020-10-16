#!/usr/bin/perl6

my $last = 1000000;
my $max = 0;
my $maxi = 0;
loop (my $i = 1; $i < $last; $i++) {
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
say $maxi;

sub next_term($num) {
  my $retval = ($num % 2) ?? $num + $num + $num + 1 !! $num +> 1;
  return $retval;
}
