#!/bin/bash

## Configure
## ----------------------------------------------------------------------------
SERVER_LIST="10.0.0.2 10.0.0.3 10.0.0.4"
JMETER_HOME=/data/jmeter

## Main
## ----------------------------------------------------------------------------
for server in ${SERVER_LIST}
do
	# Check Process IDs
	pids=$(ssh root@${server} ps -ef | grep jmeter-server | grep -v grep | awk '{print $2}')

	# Restart jmeter-server
	ssh root@${server} "kill `echo ${pids}` 2>/dev/null ; sleep 1 ; cd ${JMETER_HOME}/bin ; nohup ./jmeter-server >/dev/null &"
done
