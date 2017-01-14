#!/bin/perl
use strict;
use utf8;
use open qw/:std :utf8/;

my $buffer;

{
  local $/ = undef;
  open INFILE, $ARGV[0] or die("Cannot open $ARGV[0]");
  $buffer = <INFILE>;
  close INFILE;
}

$buffer =~ s/src="playsnd5.js"/src="playsnd.v2.1.js"/;

print $buffer;

  
