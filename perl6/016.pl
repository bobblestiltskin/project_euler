#!/usr/bin/perl6
my $x = 2;
my $y = 1000;
$x = $x ** $y;

my $string = $x;
my $sum = 0;
for (0 .. $string.chars - 1) {
  $sum += substr($string, $_, 1)
}
say $sum;
