opendir DIRFILE, ".";
@filelist = readdir DIRFILE;
closedir DIRFILE;

foreach $item (@filelist)
{
	next if ($item !~ m/wav$/);
	$new = $item;
	$new =~ s/wav$/mp3/;
	system("~/lame/frontend/lame $item $new");
	print "Converted to $new\n";
}
