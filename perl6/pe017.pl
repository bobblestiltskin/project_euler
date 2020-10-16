#!/usr/bin/perl6

my @units = <one two three four five six seven eight nine>;

my @tens = (
"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
"twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
"thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
"forty", "fortyone", "fortytwo", "fortythree", "fortyfour", "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
"fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour", "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
"sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour", "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
"seventy", "seventyone", "seventytwo", "seventythree", "seventyfour", "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
"eighty", "eightyone", "eightytwo", "eightythree", "eightyfour", "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
"ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour", "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"
);

my $hcount = 7; # "hundred";
my $handcount = 10; # "hundred and ";

my %unit_hash;
for (@units) {
  %unit_hash{$_} = $_.chars;
}

my %ten_hash;
for (@tens) {
  %ten_hash{$_} = $_.chars;
}

my $count = 0;
$count += $_ for (values %unit_hash);
$count += $_ for (values %ten_hash);
for (@units) -> $unit {
  $count += %unit_hash{$unit} + $hcount;
  $count += %unit_hash{$unit} + $handcount + $_ for (values %unit_hash);
  $count += %unit_hash{$unit} + $handcount + $_ for (values %ten_hash);
}
my $onek = "one thousand";
$count += $onek.chars - 1; # contains a space
print $count,"\n";
