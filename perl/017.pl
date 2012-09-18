#!/usr/bin/perl -w
use strict;

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

my $units = [ qw(
one two three four five six seven eight nine 
)];

my $tens = [ qw(
ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen 
twenty twentyone twentytwo twentythree twentyfour twentyfive twentysix twentyseven twentyeight twentynine 
thirty thirtyone thirtytwo thirtythree thirtyfour thirtyfive thirtysix thirtyseven thirtyeight thirtynine 
forty fortyone fortytwo fortythree fortyfour fortyfive fortysix fortyseven fortyeight fortynine 
fifty fiftyone fiftytwo fiftythree fiftyfour fiftyfive fiftysix fiftyseven fiftyeight fiftynine 
sixty sixtyone sixtytwo sixtythree sixtyfour sixtyfive sixtysix sixtyseven sixtyeight sixtynine 
seventy seventyone seventytwo seventythree seventyfour seventyfive seventysix seventyseven seventyeight seventynine 
eighty eightyone eightytwo eightythree eightyfour eightyfive eightysix eightyseven eightyeight eightynine 
ninety ninetyone ninetytwo ninetythree ninetyfour ninetyfive ninetysix ninetyseven ninetyeight ninetynine 
)];

my $unit_hash;
foreach my $unit (@$units) {
  $unit_hash->{$unit} = length($unit);
}

my $ten_hash;
foreach my $ten (@$tens) {
  $ten_hash->{$ten} = length($ten);
}

my $count = 0;
$count += $_ for (values %$unit_hash);
$count += $_ for (values %$ten_hash);
foreach my $unit (@$units) {
  my $hcount = 7; # "hundred";
  my $handcount = 10; # "hundred and ";
  $count += $unit_hash->{$unit} + $hcount;
  $count += $unit_hash->{$unit} + $handcount + $_ for (values %$unit_hash);
  $count += $unit_hash->{$unit} + $handcount + $_ for (values %$ten_hash);
}
my $onek = "one thousand";
$count += length($onek) - 1; # contains a space
print "COUNT is $count\n";
