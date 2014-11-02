import datetime
import sys

import paramiko
import settings

import logging

class SSHClient(paramiko.SSHClient):
	"""
	"""

	def __init__(self, *args, **kwargs):
		"""
		"""
		super(paramiko.SSHClient, self).__init__(*args, **kwargs)
		self._system_host_keys = paramiko.HostKeys()
		self._host_keys = paramiko.HostKeys()
		self._host_keys_filename = None
		self._log_channel = None
		self._policy = paramiko.AutoAddPolicy()
		self._transport = None
		self._agent = None
		self.load_system_host_keys()

		self._is_connected = False

	def establish_connection(self):
		"""
		Connecting against remote ssh and ensuring it's not over-connecting 
		"""
		if not self._is_connected:

			self.connect(
				settings.REMOTE_SSH_HOST, 
				username=settings.REMOTE_SSH_USERNAME, 
				# password=settings.REMOTE_SSH_PASSWORD,
				# port=settings.REMOTE_SSH_PORT
			)

			self._is_connected = True

			self._transport.set_keepalive(10)


	def ssh(self, command):
		"""
		Executing ssh command against defined ssh connection and returning back code, stdout and stderr
		"""
		logging.warning("Executing (command: %s)" % command)

		self.establish_connection()

		channel = self.get_transport().open_session()
		channel.exec_command(command)

		stdout = ""
		stderr = ""

		while not channel.exit_status_ready():
			stdout_chunk = channel.recv(1024)
			stderr_chunk = channel.recv_stderr(1024)
			stdout += stdout_chunk
			stderr += stderr_chunk
			logging.warning(stdout)
			logging.warning(stderr_chunk)

		return_code = channel.recv_exit_status()
		return return_code, stdout, stderr

