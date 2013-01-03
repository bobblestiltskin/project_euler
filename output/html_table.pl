#!/usr/bin/perl -w
use strict;
use CGI;
use DataHash qw(get_data_hash);

my $query = CGI->new;
my $output_dir = "./output";
my $hash = get_data_hash($output_dir);

print $query->start_html(-title => 'Project Euler Timings'),"\n";
print $query->start_table,"\n";
print $query->start_th;
print $query->start_td;
print $query->end_td;
foreach my $language (sort keys $hash) {
  print $query->start_td;
  print $language;
  print $query->end_td;
}
print $query->end_th,"\n";

my $language = 'perl';
foreach my $number (sort {$a <=> $b} keys $hash->{$language}) {
  print $query->start_Tr;
  print $query->start_td;
  print $number;
  print $query->end_td;
  foreach my $language (sort keys $hash) {
    print $query->start_td;
    print $hash->{$language}->{$number}->{elapsed} if (defined $hash->{$language}->{$number}->{elapsed});
    print $query->end_td;
  }
  print $query->end_Tr,"\n";
}
print $query->end_table,"\n";
print $query->end_html,"\n";
