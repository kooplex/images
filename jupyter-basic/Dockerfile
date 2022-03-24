#FROM continuumio/anaconda3

FROM base-conda_ubuntu20-v4.0


RUN pip install pymysql pymssql psycopg2 kubernetes

# SLURM 
#RUN apt update && apt install -y slurm-client  &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN pip install jupyterlab_slurm 

#RUN /opt/conda/bin/conda update -y --all

# Jupyter specific settings and templates
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
########## add the rest
#ADD init /init/
#RUN chmod a+x /init/91-startsshagent.sh

WORKDIR /


