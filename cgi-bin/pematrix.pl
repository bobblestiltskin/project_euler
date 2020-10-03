#!/usr/bin/perl

use strict;
use warnings;
	
use Data::Dumper;

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
    language_name => 'racket',
    display => 'Racket',
    extension => 'rkt'
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

my $problems = [
  {number => '001'}, {number => '002'}, {number => '003'}, {number => '004'}, {number => '005'},
  {number => '006'}, {number => '007'}, {number => '008'}, {number => '009'}, {number => '010'},
  {number => '011'}, {number => '012'}, {number => '013'}, {number => '014'}, {number => '015'},
  {number => '016'}, {number => '017'}, {number => '018'}, {number => '019'}, {number => '020'},
  {number => '021'}, {number => '022'}, {number => '023'}, {number => '024'}, {number => '025'},
];

my $data = {
  "problems" => $problems,
  "languages" => $languages,
};

print header;  

my $tt = Template->new;
$tt->process('templates/pematrix.tt', $data) or die $tt->error;
