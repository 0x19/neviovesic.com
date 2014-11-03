import logging
from fabric.api import *
from clint.textui import colored

from deployment import settings

# Silence the paramiko logs
l = logging.getLogger("paramiko")
l.setLevel(logging.ERROR)


env.user = settings.REMOTE_SSH_USERNAME
env.hosts = settings.REMOTE_SSH_HOSTS


@task(alias='deploy')
def deploy_service():
	"""
	Command used to deploy project which includes propagating nginx changes, codebase changes and restarting necesarry services
	"""
	print colored.yellow('Running deployment (project: %s) (ssh: %s@%s)' % (
		settings.PROJECT_NAME, settings.REMOTE_SSH_USERNAME, settings.REMOTE_SSH_HOSTS
	))

	run("bash %s/deployment/shell/deploy.sh" % settings.REMOTE_BASE_PROJECT_PATH)


@task(alias='status')
def service_status():
	"""
	Command used to retreive status of the service. It will return netstat grep just due to simplicity
	"""
	print colored.yellow('Fetching service status (project: %s) (ssh: %s@%s)' % (
		settings.PROJECT_NAME, settings.REMOTE_SSH_USERNAME, settings.REMOTE_SSH_HOSTS
	))

	run("netstat -tulpn | grep :5050")

'''
import logging
from deployment import settings
from deployment.ssh import SSHClient

# Silence the paramiko logs
logging.getLogger("paramiko").setLevel(logging.WARNING)
logging.getLogger().setLevel(logging.WARNING)

def deploy():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)
	SSHClient().ssh("""
		bash %s/deployment/shell/deploy.sh
	""" % (settings.REMOTE_BASE_PROJECT_PATH))

def start():
	logging.warning("Starting %s..." % settings.PROJECT_NAME)
	SSHClient().ssh("""
		source ~/.profile;
		revel run neviovesic prod > /root/gocode/src/neviovesic/neviovesic.log 2>&1 &
	""")

def stop():
	logging.warning("Stoping %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic stop')

def restart():
	logging.warning("Restarting %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('service neviovesic restart')

def status():
	logging.warning("Fetching status %s..." % settings.PROJECT_NAME)
	SSHClient().ssh('netstat -tulpn | grep :5050')
'''