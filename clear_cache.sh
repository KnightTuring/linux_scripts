#!/bin/bash
if [ $# -ge 2 ] 
then
	echo "Too many arguments, use --help"

elif [ -z "$1" ] 
then
	echo "Use --help"

elif [ "$1" = "--help" ] 
then
	echo $1
	echo "--1 : Clear Page cache only"
	echo "--2 : Clear dentries and inodes"
	echo "--3 : Clear PageCache, dentries and inodes(!!EXERCISE CAUTION!!)"

elif [ "$1" = "--1" ] 
then
	echo "---> Cleaning PageCache only..."
	sync; echo 1 > /proc/sys/vm/drop_caches
	echo "Cleaned[OK]"

elif [ "$1" = "--2" ] 
then
	echo "---> Cleaning dentries and inodes..."
	sync; echo 2 > /proc/sys/vm/drop_caches
	echo "Cleaned[OK]"

elif [ "$1" = "--3" ] 
then
	echo "--------------CAUTION--------------"
	echo "Do not use in production systems unless you know what you are doing"
	echo "-----------------------------------"
	echo "Proceed(Y/N): "
	read proceed_flag
	if [ "$proceed_flag" = "Y" ] 
	then
		echo "---> Cleaning PageCache, dentries and inodes..."
		sync; echo 3 > /proc/sys/vm/drop_caches
		echo "Cleaned[OK]"
	fi
fi

	
