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
foreach my $file_name (@split_names) {
	#set the name variable to default for regex
	$_ = $file_name;
	#if the file is an sql file
	if ( /\.sql$/ ) {
		#get the name of the procedure, without the extension
		my $name = substr($file_name, 0, -4);
		#do magic
		print "SQL:$file_name";
		print "NAME:$name";
		`mysql -utest -ptest test -e 'drop procedure if exists $name;'`;
		`mysql -utest -ptest test < $file_name`;
	}
	print $file_name;

}
