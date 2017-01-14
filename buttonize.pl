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

$buffer =~ s!<img\s+src="pics/speaker.png"\s+alt="Play"\s+class="speaker"\s+onclick="playSound\('([^']+)'\)"\s*/>!<button onclick="playSound('\1')"><img src="pics/speaker.png" alt="Play" class="speaker"/></button>!gm;

print $buffer;

  
