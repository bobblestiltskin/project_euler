#!/usr/bin/perl -w

# to display solutions for all problem in one languages

use strict;
use CGI;
use DirHandle;
use lib qw(.);
use PEcgi qw(display_file get_web_page decode_web_page get_problem_as_string print_language_number $extensions $problems);

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;

my $language = $query->param('language');
if ((defined $language) and (grep {/^$language$/} keys %$extensions)) {
  print $query->start_html(-title => 'Project Euler Problems in ' . $language);
  print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";
  my @num_files;
  my $dirh = DirHandle->new(join('/', $dir, $language));
  if (defined $dirh) {
    while (defined (my $file = $dirh->read)) {
      next if ($file =~ /^\.\.?$/);
      if ((my $stem = $file) =~ s/\.$extensions->{$language}$//) {
        $stem =~ s/^pe//;
        push @num_files, $stem if ($stem =~ /^\d+$/);
      }
    }
    foreach my $num_file (sort {$a <=> $b} @num_files) {
      print get_problem_as_string($num_file);
      print_language_number($query, $dir, $language, $num_file);
    }
  }
} else {
  print $query->start_html;
  print "Need a language as an argument!!!", "\n";
}
print $query->end_html;
