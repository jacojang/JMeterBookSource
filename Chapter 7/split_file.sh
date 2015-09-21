#!/bin/bash

infile=$1
split_count=$2
tmpfile=`tempfile`

function usage()
{
	echo ""
	echo "Usage : $0 infile split_count"
	echo ""
}

if [ ! -f "${infile}" ] ; then
	echo " ****** Error : Invalid input file "
	usage
	exit -1
fi

if [ "x${split_count}" = "x" ] ;then
	echo " ****** Error : Invalid split count "
	usage
	exit -1
fi

ext=${infile##*.}
if [ "x${ext}" = "x${infile}" ] ; then
	ext=""
fi
prefix=`basename ${infile} .${ext}`

split -n ${split_count} --additional-suffix=".${ext}" --numeric-suffixes=1 ${infile} "${prefix}_"
