#!/usr/bin/perl
use strict;
use warnings;

#set vars 
my $file_names;
my @split_names;

#run the pull command
`git pull origin master`;
#check the diff of the current version and the last version
$file_names=`git diff --name-only HEAD\@{1}`;
#split the diff into an array for each filename
@split_names=split('\n', $file_names);
#loop over each name
foreach my $name (@split_names) {
	#set the name variable to default for regex
	$_ = $name;
	#if the file is an sql file
	if ( /\.sql$/ ) {
		#do magic
		print "SQL:$name";
	}
	print $name;

}
