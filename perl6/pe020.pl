#!/usr/bin/perl6

my $num = 1;
for 1 .. 100 {
  $num *= $_;
}
my $string = "" ~ $num; # stringify
my $sum = 0;
for 0 .. $string.chars - 1 {
  my $digit = substr($string, $_, 1);
  $sum += $digit;
}
say $sum;
