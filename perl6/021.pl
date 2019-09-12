#!/usr/bin/perl6

my %map;
for 0 .. 9999 {
  %map{$_} = sum_factors($_);
}

my $total;
for %map.kv -> $key, $value 
{
  $total += $key if ((defined %map{$value}) && ($key != $value) && (%map{$value} == $key));
}
say $total;

sub sum_factors($number) {
  my $sum = 1;
  loop (my $i = 2; $i <= sqrt($number); $i++) {
    if (!($number % $i)) {
      $sum += ($i + ($number / $i));
    }
  }
  return $sum;
}
  
