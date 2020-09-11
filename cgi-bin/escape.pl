#!/usr/bin/perl -w
use strict;
use CGI;

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;
print $query->start_html;

my $file = $query->param('file');
if ((defined $file) and ($file =~ m!^(?:perl|asm|forth|c|c\+\+|python|java|javascript|racket|erlang|ocaml|haskell)/(?:pe)?\d+\.(?:pl|s|fs|c|cpp|py|java|js|rkt|erl|ml|hs)$!)) {
  print $query->start_pre;
  $file = $dir . $file;
  open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
  while (<$fh>) {
    s/\&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    print;
  }
  close $fh;
  print $query->end_pre;
} else {
  print "Need 1 filename as an argument!!!", "\n";
}
print $query->end_html;
