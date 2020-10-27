#!/usr/bin/perl

use strict;
use warnings;
use Carp;

use Template;
use CGI qw(:all);  

my $languages = [
  {
    language_name => 'perl',
    display => 'Perl',
    extension => 'pl'
  },
  {
    language_name => 'perl6',
    display => 'Perl 6',
    extension => 'pl'
  },
  {
    language_name => 'c',
    display => 'C',
    extension => 'c'
  },
  {
    language_name => 'c%2b%2b',
    display => 'C++',
    extension => 'cpp'
  },
  {
    language_name => 'python',
    display => 'Python',
    extension => 'py'
  },
  {
    language_name => 'java',
    display => 'Java',
    extension => 'java'
  },
  {
    language_name => 'javascript',
    display => 'Javascript',
    extension => 'js'
  },
  {
    language_name => 'forth',
    display => 'Forth',
    extension => 'fs'
  },
  {
    language_name => 'go',
    display => 'Go',
    extension => 'go'
  },
  {
    language_name => 'racket',
    display => 'Racket',
    extension => 'rkt'
  },
  {
    language_name => 'rust',
    display => 'Rust',
    extension => 'rs'
  },
  {
    language_name => 'erlang',
    display => 'Erlang',
    extension => 'erl'
  },
  {
    language_name => 'ocaml',
    display => 'Ocaml',
    extension => 'ml'
  },
  {
    language_name => 'asm',
    display => 'ARM asm',
    extension => 's'
  },
];  

my $problems = [];
for (my $i=1; $i <= 25; $i++) {
	my $ns = sprintf("%03d", $i);
	push @$problems, {number => "$ns"};
}

my $data = {
  "problems" => $problems,
  "languages" => $languages,
};

print header;  

my $tt = Template->new;
$tt->process('templates/pematrix.tt', $data) or croak $tt->error;
