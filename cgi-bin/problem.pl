#!/usr/bin/perl -w

# to display solutions for any problem in all written languages
use strict;
use CGI;
use DirHandle;
use lib qw(.);
use PEcgi qw(display_file get_web_page decode_web_page get_problem_as_string print_language_number $extensions);

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;
my $number = $query->param('number');
if ((defined $number) and ($number =~ /^\d+$/)) {
  print $query->start_html(-title => 'Project Euler Problem ' . $number);
  print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";
  print get_problem_as_string($number);
  my $dirh = DirHandle->new($dir);
  if (defined $dirh) {
    foreach my $subdir (sort readdir $dirh) {
      next if (($subdir eq '.') or ($subdir eq '..'));
      next unless (grep {/^$subdir$/} keys %$extensions);
      print_language_number($query, $dir, $subdir, $number);
    }
  } 
} else {
  print $query->start_html;
  print "Need 1 number as an argument!!!", "\n";
}
print $query->end_html;
