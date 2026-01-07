FROM base-aptp_cuml_ubuntu22-v8

# Jupyter specific settings and templates
#ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
ADD etc/kooplex-logo.png /opt/conda/lib/python3.12/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.12/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
RUN ls
ADD etc/entrypoint.sh /entrypoint.sh
#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh

WORKDIR /

