#!/usr/bin/perl

#
#	Convert embedded syllables in a text file to the appropriate HTML
#	<img> tags that display the Russian alphabet.
#
#	The original file is overwritten by the converted file.
#
#	Embedded Russian is in the form:
#
#		\r(text)
#		\r(text/alignment)
#
#	where "alignment" is left, right, middle, absmiddle, baseline, etc.
#	without quotemarks. If you don't put in an alignment, absmiddle is used
#	since it's the most useful.
#
#
#
#	Written by J. David Eisenberg
#	permission to duplicate/use given freely as long as author credit remains
#

print "up one level of directory? ";
$prefix = <STDIN>;
chomp $prefix;
$prefix =  ($prefix =~ /y/i) ? "../" : "";

#
#	list of multi-character items
#

	

#
#	use the correspondence in QWERTY keyboard to make life easier.
#
$smallStr = "abvgde\x85]zijklmnoprstufxchw`=y-\\[q";
$capStr =   "ABVGDE\x86}ZIJKLMNOPRSTUFXCHW~+Y_|{Q";
$doubleStr = "\x81\x82\x83\x84"; # --, __, ++, ==
%doubleMap = ("\x81" => "x2d", "\x82" => "x5f", "\x83" => "x2b", "\x84" => "x3d");

#
#	accented characters
#
%accent = (
"a'" => "а&#x301;",
"e'" => "е&#x301;",
"i'" => "и&#x301;",
"o'" => "о&#x301;",
"u'" => "у&#x301;",
"y'" => "ы&#x301;",
"\\'" => "э&#x301;",
"['" => "",
"q'" => "яa33",
"A'" => "А",
"E'" => "Е",
"I'" => "И",
"O'" => "О",
"U'" => "У",
"Y'" => "ac29",
"|'" => "ac31",
"{'" => "ac32",
"Q'" => "ac33",
);

sub russify
{
	my ($str) = @_;
	my ($origStr, $str1, $i, $pfx, $n);
	
	($str1, $alignment) = split(/\//, $str);
	if ($alignment eq "")
	{
		$alignment = "absmiddle";
	}
	$str = $str1;
	$str1 = "";
	
	$new = "<!-- r(" . $str . ") -->";

	$str =~ s/--/\x81/g;
	$str =~ s/__/\x82/g;
	$str =~ s/\+\+/\x83/g;
	$str =~ s/==/\x84/g;
	$str =~ s/e:/\x85/g;
	$str =~ s/E:/\x86/g;

	if ($alignment)
	{
		$alignment =~ tr/ //d;
		$alignment = " align=\"" . $alignment . "\"";
	}
	
	@letters = split //, $str;

	$i = 0;
	while ($i < scalar @letters)
	{
		if ($letters[$i+1] ne "'")
		{
			# check to see if it's a small letter
			$n  = index $smallStr, $letters[$i];
			if ($n >= 0)
			{
				$str1 = "s" . ($n+1);
			}
			else
			{
				$n = index $capStr, $letters[$i];
				if ($n >= 0)
				{
					$str1 = "c" . ($n+1);
				}
				else
				{
					$n = index $doubleStr, $letters[$i];
					if ($n >= 0)
					{
						$str1 = $doubleMap{$letters[$i]};
					}
					else
					{
						$str1 = sprintf "d%d", ord $letters[$i];
					}
				}
			}
			$i++;
		}
		else
		{
			$str1 = $accent{$letters[$i] . $letters[$i + 1]};
			$i += 2;
		}
		$new .= qq!<img\n\tsrc="${prefix}ltr/$str1.gif" width="12" height="22"$alignment />!
	}
	$new .= "\n";
	return $new;
}

$filename = @ARGV[0];

if ($filename)
{
	$newname = "tempfile";
	if ($newname)
	{
		$result = open INFILE, $filename;
		open OUTFILE, ">$newname";
		while (<INFILE>)
		{
			chomp;
			s/^\x0a//;
			s/\s+$//;
			s/\\r\((.*?)\)/&russify($1)/eg;
			print OUTFILE $_, "\n";
		}
		close INFILE;
		close OUTFILE;
		rename $newname, $filename;
	}
}
