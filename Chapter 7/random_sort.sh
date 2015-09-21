#!/bin/bash

infile=$1
outfile=$2
tmpfile=`tempfile`

function usage()
{
	echo ""
	echo "Usage : $0 infile [outfile]"
	echo ""
}

if [ ! -f "${infile}" ] ; then
	echo " ****** Error : Invalid input file "
	usage
	exit -1
fi

if [ "x${outfile}" = "x" ] ; then
	outfile=${infile}
fi


sort -R ${infile} > ${tmpfile}
cat ${tmpfile} > ${outfile}
