#!/usr/bin/perl6

my $last = 500 +> 1;

my $num = 0;
my $i = 0;
my $j = 1;
while ($num < $last) {
  $i = $i + $j;
  $num = get_num_divisors($i);
  $j++;
}
say $i;

sub get_num_divisors($num) {
  my $counter = 0;
  my $running = 1;
  while ($running <= sqrt($num)) {
    $counter++ if (not ($num % $running));
    $running++;
  }
  return $counter;
}
