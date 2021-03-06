# Copyright (c) Jupyter Development Team.
from jupyter_core.paths import jupyter_data_dir
import subprocess
import os
import errno
import stat

PEM_FILE = os.path.join(jupyter_data_dir(), 'notebook.pem')

c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.port = 8000
c.NotebookApp.open_browser = False
c.HistoryManager.hist_file = '/tmp/ipython_hist.sqlite'
c.NotebookApp.allow_origin = '*'
#c.NotebookApp.set_default('nbserver_extensions', {})['jupyter_nbextensions_configurator'] = True
c.NotebookApp.trust_xheaders = True
c.NotebookApp.password_required = False
c.NotebookApp.disable_check_xsrf = False
c.NotebookApp.allow_remote_access=True
c.NotebookApp.token = 'aiSiga1aiFai2AiZu1veeWein5gijei8yeLay2Iecae3ahkiekeisheegh2ahgee'
c.FileContentsManager.delete_to_trash = False

c.MappingKernelManager.cull_connected = True
c.MappingKernelManager.cull_interval = 1000
c.MappingKernelManager.cull_idle_timeout = 86000
#c.NotebookApp.shutdown_no_activity_timeout = 100000

# This will enable the option to switch between conda envs in the notebook-server
#c.NotebookApp.kernel_spec_manager_class = 'nb_conda_kernels.CondaKernelSpecManager'


c.LatexConfig.latex_command = 'pdflatex'

# Set a certificate if USE_HTTPS is set to any value
if 'USE_HTTPS' in os.environ:
    if not os.path.isfile(PEM_FILE):
        # Ensure PEM_FILE directory exists
        dir_name = os.path.dirname(PEM_FILE)
        try:
            os.makedirs(dir_name)
        except OSError as exc: # Python >2.5
            if exc.errno == errno.EEXIST and os.path.isdir(dir_name):
                pass
            else: raise
        # Generate a certificate if one doesn't exist on disk
        subprocess.check_call(['openssl', 'req', '-new', 
            '-newkey', 'rsa:2048', '-days', '365', '-nodes', '-x509',
            '-subj', '/C=XX/ST=XX/L=XX/O=generated/CN=generated',
            '-keyout', PEM_FILE, '-out', PEM_FILE])
        # Restrict access to PEM_FILE
        os.chmod(PEM_FILE, stat.S_IRUSR | stat.S_IWUSR)
    c.NotebookApp.certfile = PEM_FILE

# Set a password if PASSWORD is set
if 'PASSWORD' in os.environ:
    from IPython.lib import passwd
    c.NotebookApp.password = passwd(os.environ['PASSWORD'])
    del os.environ['PASSWORD']
