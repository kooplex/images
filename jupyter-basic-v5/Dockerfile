FROM base-kube_ubuntu20-v5

# SLURM 
#RUN apt update && apt install -y slurm-client  &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*
#RUN pip install jupyterlab_slurm 

# Jupyter specific settings and templates
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh

########## add the rest
#ADD init /init/
#RUN chmod a+x /init/91-startsshagent.sh
#RUN mkdir /etc/mnt
RUN sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf
#RUN mkdir /init
#ADD etc/01-nslcd /init/01-nslcd
#RUN chmod +x /init/01-nslcd

RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 

WORKDIR /


