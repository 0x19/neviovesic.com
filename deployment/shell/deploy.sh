#!/bin/bash

HOME_DIR=`eval echo ~`
PROJECT_PATH=`eval echo ~/gocode/src/neviovesic/`

# Activate whatever that we eventually need to activate in order to run deployment
source $HOME_DIR/.profile

echo -e "$(tput setaf 2)Entering $PROJECT_PATH"
cd $PROJECT_PATH

sleep 1

echo "Ensuring we are on the right github branch ..."
git checkout PRODUCTION

echo "Fetching latest version of the code from github ..."
git pull origin PRODUCTION

echo -e "$(tput setaf 2)Making changes to nginx configuration files ..."

# I know but I really wanna make sure i don't rewrite something else for now ...
cp $PROJECT_PATH/deployment/nginx/nginx.conf /etc/nginx/
cp $PROJECT_PATH/deployment/nginx/naxsi_core.rules /etc/nginx/
cp -r $PROJECT_PATH/deployment/nginx/conf.d/ /etc/nginx/



service nginx restart