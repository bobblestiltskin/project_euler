#!/usr/bin/perl -w

# to display solutions for all problem in one languages

use strict;
use CGI;
use DirHandle;
use PEcgi qw(display_file get_web_page decode_web_page get_problem_as_string);

my $extensions = {
  asm		=> 's',
  c		=> 'c',
  'c++'		=> 'cpp',
  forth		=> 'fs',
  haskell	=> 'hs',
  java		=> 'java',
  perl		=> 'pl',
  python	=> 'py',
};

my $prefix = {
  java => 'pe',
};

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;

my $language = $query->param('language');
if ((defined $language) and (grep {/^$language$/} keys %$extensions)) {
  $dir .= '/' . $language;
  print $query->start_html(-title => 'Project Euler Problems in ' . $language);
  print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";
  my $dirh = DirHandle->new($dir);
  if (defined $dirh) {
    while (defined (my $file = $dirh->read)) {
      next if ($file =~ /^\.\.?$/);
      if ($file =~ /$extensions->{$language}$/) {
        (my $stem = $file) =~ s/\.$extensions->{$language}$//;
        my $prefix = $prefix->{$language};
        $stem =~ s/^$prefix// if ($prefix);
        if ($stem =~ /^\d+$/) {
          print get_problem_as_string($stem);
        }
        display_file($query, $dir, $file);
      }
      if (($extensions->{$language} =~ /^c/) && ($file =~ /\.h$/)) {
# print header files for c and c++
        display_file($query, $dir, $file);
      }
    }
  }
} else {
  print $query->start_html;
  print "Need a language as an argument!!!", "\n";
}
print $query->end_html;
