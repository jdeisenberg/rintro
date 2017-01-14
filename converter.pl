#!/bin/perl
use strict;
use utf8;
use open qw/:std :utf8/;

my $caps  = '-АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
my $small = '-абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
my $buffer;

{
  local $/ = undef;
  open INFILE, $ARGV[0] or die("Cannot open $ARGV[0]");
  $buffer = <INFILE>;
  close INFILE;
}

$buffer =~ s!<img\s+src="(?:red)?ltr/c(\d+).png"[^>]+>!russian($caps,$1)!egm;
$buffer =~ s!<img\s+src="(?:red)?ltr/s(\d+).png"[^>]+>!russian($small,$1)!egm;
$buffer =~ s!<img\s+src="(?:red)?ltr/ac(\d+).png"[^>]+>!accent($caps, $1)!egm;
$buffer =~ s!<img\s+src="(?:red)?ltr/a(\d+).png"[^>]+>!accent($small, $1)!egm;
$buffer =~ s!<img\s+src="(?:red)?ltr/d(\d+).png"[^>]+>!chr($1)!egm;

$buffer =~ s!<a href="javascript:top.ExtSound\('([^.]+).wav'\);"><img[^>]+></a>!<img src="pics/speaker.png" alt="Play" class="speaker" onclick="playSound('\1')"/>!gm;

$buffer =~ s!<audio([\S\s]*)</audio>!!gm;

$buffer =~ s!<img src="l_arrow.png"[^>]+>!\&larr; !gm;

$buffer =~ s!</body>!<audio id="sound" src="rsnd/silent.wav"></audio>
</body>!;

print $buffer;

sub russian {
  my $list = shift;
  my $n = shift;
  return (substr($list, $n, 1));
}

sub accent {
  my $list = shift;
  my $n = shift;
  return (substr($list, $n, 1) . '&#x301;');
}


  