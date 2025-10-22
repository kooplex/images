FROM base-extras_ubuntu20-v5

# cmake
RUN apt update && \
    apt install -y --no-install-recommends build-essential cmake && \
    rm -rf /var/lib/apt/lists/*

# cityflow
RUN git clone https://github.com/cityflow-project/CityFlow.git /opt/CityFlow
RUN cd /opt/CityFlow && \
    pip install .

RUN $CONDA_DIR/bin/conda install --quiet --yes  -c conda-forge tensorflow

RUN $CONDA_DIR/bin/pip install dash_bootstrap_components gunicorn

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
RUN sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf

RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 

WORKDIR /

