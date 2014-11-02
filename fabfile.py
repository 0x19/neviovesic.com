import logging
from deployment import settings
from deployment.ssh import SSHClient

# Silence the paramiko logs
logging.getLogger("paramiko").setLevel(logging.INFO)
logging.getLogger().setLevel(logging.INFO)

def deploy():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic deploy')

def start():
	logging.warning("Starting %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('revel run neviovesic prod > /root/gocode/src/neviovesic/neviovesic.log 2>&1 &')

def stop():
	logging.warning("Stoping %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic stop')

def restart():
	logging.warning("Restarting %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic restart')

def status():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic status')