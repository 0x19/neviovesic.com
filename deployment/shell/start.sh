#!/bin/bash

HOME_DIR=`eval echo ~`
PROJECT_PATH=`eval echo ~/gocode/src/neviovesic/`
PROJECT_NAME="neviovesic" # app name for ogs etc ...

# Activate whatever that we eventually need to activate in order to run deployment
source $HOME_DIR/.profile

echo -e "$(tput setaf 2)Entering $PROJECT_PATH"
cd $PROJECT_PATH

sleep 1

echo -e "$(tput setaf 2)Starting revel applilcation back up ..."
revel run neviovesic prod > /root/gocode/src/neviovesic/neviovesic.log 2>&1 &
PID=$!
echo $PID > "$PROJECT_PATH/$PROJECT_NAME.pid"