FROM base-aptp_ubuntu20-v6

# Jupyter specific settings and templates
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.9/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.9/site-packages/notebook/static/base/images/jupyterlab.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.10/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.10/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
RUN ls
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh

WORKDIR /

