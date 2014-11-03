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

	sudo("bash %s/deployment/shell/deploy.sh" % settings.REMOTE_BASE_PROJECT_PATH)

@task(alias='start')
def service_start():
	"""
	Stop the service
	"""
	print colored.yellow('Running deployment (project: %s) (ssh: %s@%s)' % (
		settings.PROJECT_NAME, settings.REMOTE_SSH_USERNAME, settings.REMOTE_SSH_HOSTS
	))

	run("bash %s/deployment/shell/start.sh" % settings.REMOTE_BASE_PROJECT_PATH)

@task(alias='stop')
def service_stop():
	"""
	Stop the service
	"""
	print colored.yellow('Running deployment (project: %s) (ssh: %s@%s)' % (
		settings.PROJECT_NAME, settings.REMOTE_SSH_USERNAME, settings.REMOTE_SSH_HOSTS
	))

	run("bash %s/deployment/shell/stop.sh" % settings.REMOTE_BASE_PROJECT_PATH)

@task(alias='status')
def service_status():
	"""
	Command used to retreive status of the service. It will return netstat grep just due to simplicity
	"""
	print colored.yellow('Fetching service status (project: %s) (ssh: %s@%s)' % (
		settings.PROJECT_NAME, settings.REMOTE_SSH_USERNAME, settings.REMOTE_SSH_HOSTS
	))

	run("netstat -tulpn | grep :5050")