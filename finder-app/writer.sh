#!/bin/sh

# Shell script finder-app/writer.sh of Assignment 01.
# It accepts the following arguments:
#   the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile;
#   the second argument is a text string which will be written within this file, referred to below as writestr.
# It creates a new file with name and path writefile with content writestr, overwriting any existing file and creating 
# the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
# Author: Nguyen Thu Giang

writefile="$1"
writestr="$2"

filebasename=$(basename $writefile)
pathname=$(dirname $writefile)

if [ $# -eq 2 ]; then
	if [ ! -d $1 ]; then
		echo "Path does not exist. Create a new one..."
        mkdir -p "$pathname"
	fi
else
	echo "Number of input arguments should be equal to 02"
	echo "the first argument is a full path to a file (including filename) on the filesystem"
	echo " the second argument is a text string which will be written within this file"
	exit 1
fi

mkfile () {
    # Go to the directory where the file will be created
    cd "$pathname"
    echo "$writestr" > "$filebasename"
    echo "File created successfully!"
}

# Call the mkfile() function to create file with predefined content
mkfile 
