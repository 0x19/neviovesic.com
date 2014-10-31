import logging
from deployment import settings
from deployment.ssh import SSHClient


# Silence the SSH logs
logging.getLogger("paramiko").setLevel(logging.WARNING)
logging.getLogger().setLevel(logging.WARNING)


def deploy():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)

	# Execute deployment ...
	SSHClient().ssh('%sdeployment/shell/deploy.sh' % settings.REMOTE_BASE_PROJECT_PATH)


def restart():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)
	
	# Execute deployment ...
	SSHClient().ssh('ls -la')


def status():
	logging.warning("Deploying %s..." % settings.PROJECT_NAME)
	
	# Execute deployment ...
	SSHClient().ssh('%sdeployment/shell/deploy.sh' % settings.REMOTE_BASE_PROJECT_PATH)