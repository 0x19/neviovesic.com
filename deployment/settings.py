import logging
import sys

root = logging.getLogger()
root.setLevel(logging.DEBUG)

ch = logging.StreamHandler(sys.stdout)
formatter = logging.Formatter('%(asctime)s [%(levelname)s] %(name)s: %(message)s')
ch.setFormatter(formatter)
root.addHandler(ch)


PROJECT_NAME = 'Nevio Vesics Website'

# SSH hostname of the server where website is residing
REMOTE_SSH_HOST = None

# SSH username of the server where website is residing
REMOTE_SSH_USERNAME = None

# SSH password of the server where website is residing
REMOTE_SSH_PASSWORD = None

# SSH port of the server where website is residing
REMOTE_SSH_PORT = 22

# SSH remote path to the project root
REMOTE_BASE_PROJECT_PATH = '/home/telapi/gocode/neviovesic.com/'

try:
	from settings_local import *
except ImportError:
	pass