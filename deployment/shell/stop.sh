#!/bin/bash

HOME_DIR=`eval echo ~`
PROJECT_PATH=`eval echo ~/gocode/src/neviovesic/`
PROJECT_NAME="neviovesic" # app name for ogs etc ...

# Activate whatever that we eventually need to activate in order to run deployment
source $HOME_DIR/.profile

recursiveKill() { # Recursively kill a process and all subprocesses
    CPIDS=$(pgrep -P $1);
    for PID in $CPIDS
    do
        recursiveKill $PID
    done
    sleep 3 && kill -9 $1 2>/dev/null & # hard kill after 3 seconds
    kill $1 2>/dev/null # try soft kill first
}

echo -e "$(tput setaf 2)Stopping revel application (if started) ..."

if [ -f "$PROJECT_PATH/$PROJECT_NAME.pid" ]
then
	PID=`cat "$PROJECT_PATH/$PROJECT_NAME.pid"`
	recursiveKill $PID
	rm -f "$PROJECT_PATH/$PROJECT_NAME.pid"
fi