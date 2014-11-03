#!/bin/bash

HOME_DIR=`eval echo ~`
PROJECT_PATH=`eval echo ~/gocode/src/neviovesic/`

# Activate whatever that we eventually need to activate in order to run deployment
source $HOME_DIR/.profile

echo -e "$(tput setaf 2)Entering $PROJECT_PATH"
cd $PROJECT_PATH

sleep 1

echo "Fetching latest version of the code from github ..."
git pull origin PRODUCTION

service nginx restart