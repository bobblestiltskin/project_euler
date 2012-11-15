#!/usr/bin/perl -w

# to display solutions for all problem in one languages

use strict;
use Carp qw(carp croak confess);
use CGI;
use DirHandle;
use LWP::UserAgent;
use XML::LibXML;

my $extensions = {
  asm    => 's',
  c      => 'c',
  'c++'  => 'cpp',
  forth  => 'fth',
  perl   => 'pl',
  python => 'py',
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
        if ($stem =~ /^\d+$/) {
          print get_problem_as_string($stem);
        }
        display_file($dir, $file);
      }
      if (($extensions->{$language} =~ /^c/) && ($file =~ /\.h$/)) {
# print header files for c and c++
        display_file($dir, $file);
      }
    }
  }
} else {
  print $query->start_html;
  print "Need a language as an argument!!!", "\n";
}
print $query->end_html;

sub display_file {
  my $dir = shift;
  my $file = shift;

  print '<pre class="example">' . "\n";
  print "<p><b>$file</b></p>\n";
  chomp($file = join('/', $dir, $file));
  open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
  while (<$fh>) {
    s/\&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    print;
  }
  close $fh;
  print $query->end_pre;
}

sub get_web_page {
  my $url = shift;

  my $ua = LWP::UserAgent->new;
  $ua->agent('bob@fourtheye.org::problem_text_grabber');

  my $req = HTTP::Request->new('GET', $url);
  my $res = $ua->request($req);

  if ($res->is_error()) {
    carp "Error getting $url: ", $res->status_line, "\n";
    return undef;
  } else {
    $res->content;
  }
}

sub decode_web_page {
  my $html = shift;

  my $xp = XML::LibXML->load_html(string => $html);
  return ($xp->findnodes('//*[@role="problem"]'))[0];
}

sub get_problem_as_string {
  my $number = shift;

  print '<a href="http://projecteuler.net/problem=', $number, '">Description of problem</a>',"\n";

  my $wanted = decode_web_page(get_web_page("http://projecteuler.net/problem=$number"));
  my $string = $wanted->toString;
  $string =~ s/\&#13;//g;
  $string =~ s|href="|href="http://projecteuler.net/|g;
  return $string;
}
