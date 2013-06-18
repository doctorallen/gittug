#!/usr/bin/perl
use strict;
use warnings;

#set vars 
my $file_names;
my @split_names;
my $username='test';
my $password='test';
my $database_server='test.net';
my $database='test';

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
		#we use substr 5,-4 to ignore the file extension and the directory
		my $name = substr($file_name, 5, -4);
		#get the database name (the directory)
		my $database=substr($file_name, 0, 4);
		#print information
		print "SQL:$file_name\n";
		print "NAME:$name\n";
		print "DATABASE:$database\n";
		#remove procedure
		`mysql -u$username -p$password -h$database_server $database -e 'drop procedure if exists $name;'`;
		#source procedure file
		`mysql -u$username -p$password -h$database_server $database < $file_name`;
	}
}
