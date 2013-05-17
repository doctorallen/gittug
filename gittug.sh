#!/bin/bash

# Pull all of the latest code for the master branch, and set the commit log to 
# a variable
git pull origin master --quiet
commit_log=(git diff --name-only HEAD@{1})

#read the commit log line by line
echo $commit_log | while read line
do
	if echo "$line" | grep -E "(\.sql)$" ; then
		echo "SQL"
	fi
	echo "LINE:" $line 
done
