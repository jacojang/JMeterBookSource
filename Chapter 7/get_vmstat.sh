#!/bin/bash

## ----------------------------------------------------------------------------
## vmstat logger
##
## Usage : ./get_vmstat.sh [outfile]
## Options:
##          outfile   결과가 저장될 파일 (Default:/dev/null)
##
## @author jacojang<jacojang@jacojang.com>
## ----------------------------------------------------------------------------

OUTFILE=$1;shift;

if [ "x${OUTFILE}" = "x" ] ; then
	OUTFILE=/dev/null
fi

## Print Header
## ----------------------------------------------------------------------------
echo ",,procs,,memory,,,,swap,,io,,system,,cpu,,,," | tee -a ${OUTFILE}
echo "date,hour,r,b,swpd,free,buff,cache,si,so,bi,bo,in,cs,us,sy,id,wa,st" | tee -a ${OUTFILE}

## Print Data
## ----------------------------------------------------------------------------
vmstat 2 | grep --line-buffered [0-9] | while read p_r p_b m_swpd m_free m_buff m_cache s_si s_so i_bi i_bo s_in s_cs c_us c_sy c_id c_wa c_st
do
	ctime=`date +%Y%m%d,%H%M%S`
	echo ${ctime},${p_r},${p_b},${m_swpd},${m_free},${m_buff},${m_cache},${s_si},${s_so},${i_bi},${i_bo},${s_in},${s_cs},${c_us},${c_sy},${c_id},${c_wa},${c_st} | tee -a ${OUTFILE}
done
