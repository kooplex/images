#FROM continuumio/anaconda3

FROM base-conda-v3.0


RUN pip install pymysql pymssql psycopg2

# SLURM 
#RUN apt update && apt install -y slurm-client  &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN pip install jupyterlab_slurm 

RUN /opt/conda/bin/conda update -y pandas

# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*

# basic
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
RUN chmod a+x /opt/conda/bin/jupyter-notebook-kooplex

# Add local files as late as possible to avoid cache busting
ADD etc/start-notebook.sh /usr/local/bin/start-notebook.sh
RUN chmod a+x /usr/local/bin/start-notebook.sh
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

RUN sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs

########## add the rest
ADD init /init/
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
RUN chmod a+x /init/91-startsshagent.sh

WORKDIR /


