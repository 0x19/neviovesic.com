#!/bin/bash

if [[ `id -u` -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

$USER="root"
HOME_DIR=`eval echo ~`
PROJECT_PATH=`eval echo ~/gocode/src/neviovesic/`
PROJECT_NAME="neviovesic" # app name for ogs etc ...
GO_CMD="revel run neviovesic"

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

echo -e "$(tput setaf 2)Stopping revel application (if started) ..."

if [ -f "$PROJECT_PATH/$PROJECT_NAME.pid" ]
then
	PID=`cat "$PROJECT_PATH/$PROJECT_NAME.pid"`
	recursiveKill $PID
	rm -f "$PROJECT_PATH/$PROJECT_NAME.pid"
fi

echo -e "$(tput setaf 2)Starting revel applilcation back up ..."
#revel run neviovesic > /root/gocode/src/neviovesic/neviovesic.log 2>&1 &
/bin/su -m -l $USER -c "$GO_CMD" > "$WORKDIR/$NAME.log" 2>&1 &
PID=$!
echo $PID > "$PROJECT_PATH/$PROJECT_NAME.pid"

echo -e "$(tput setaf 2)Restarting nginx server ..."
service nginx restart