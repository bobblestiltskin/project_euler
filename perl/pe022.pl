#!/usr/bin/perl -w
use strict;
use IO::File;

my $fh = IO::File->new("../names.txt") or die "Can't open names, $!";
my $names = <$fh>;
$names =~ s/^"//;
$names =~ s/"$//;
my @names = sort split(/","/, $names);

my $total = 0;
foreach my $i (1 .. @names) {
  my $string = $names[$i - 1];
  my $sum = 0;
  foreach my $j (0 .. length($string) - 1) {
    my $letter = substr($string, $j, 1);
    $sum += ord($letter) - 64;
  }
  $total += ($sum * $i);
}
print $total,"\n";
