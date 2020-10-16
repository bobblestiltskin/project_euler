#!/usr/bin/perl6

#  9! is 362880 so after all the 10 digit numbers which 
#  start with 0 or 1 we will have passed 725760 of the 
#  combinations. The millionth combination will start
#  with a 2, since we need to count 274240 more combinations
#  after 2000000000.
#
#  8! is 40320, so there are that many 10 digit combinations starting 20.
#  The combination starting 22 is invalid (since the numerals must be
#  distinct), so we could count 6 sets of combinations of 40320 up to
#  2700000000 and then we would have seen 725760+241920 leaving 32320 to
#  find.
#
#  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
#  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

my $start = 2780000000; 
my $end   = 9876543210;

my $count = 725760 + 241920 + 30240;
my $num;
for ($start .. $end) {
  $num = sprintf("%010d", $_);
  next unless ($num ~~ /0/);
  next unless ($num ~~ /1/);
  next unless ($num ~~ /2/);
  next unless ($num ~~ /3/);
  next unless ($num ~~ /4/);
  next unless ($num ~~ /5/);
  next unless ($num ~~ /6/);
  next unless ($num ~~ /7/);
  next unless ($num ~~ /8/);
  next unless ($num ~~ /9/);
  $count++;
  last if ($count == 1000000);
}
say $num;
