#!/usr/bin/perl6

my $names = "../names.txt".IO.slurp;
# drop the leading and trailing " via substr
# split names on "," and then sort
my @names = $names.substr(1, $names.chars - 2).split('","').sort;

my $total = 0;
for 1 .. @names -> $i {
  my $string = @names[$i - 1];
  my $sum = 0;
  for 0 .. $string.chars - 1 -> $j {
    my $letter = substr($string, $j, 1);
    $sum += ord($letter) - 64;
  }
  $total += ($sum * $i);
}
say $total;
