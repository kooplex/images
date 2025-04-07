FROM base-extras_ubuntu20-v5

RUN $CONDA_DIR/bin/conda install -c conda-forge ffmpeg 

RUN $CONDA_DIR/bin/pip install opencv-python

RUN $CONDA_DIR/bin/conda install -y --override-channels -c conda-forge  plotly 
RUN $CONDA_DIR/bin/pip install schemdraw 
RUN $CONDA_DIR/bin/pip install ahkab  

# GO Teleport
RUN curl https://apt.releases.teleport.dev/gpg -o /usr/share/keyrings/teleport-archive-keyring.asc && \
    . /etc/os-release && \
    echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] \
  https://apt.releases.teleport.dev/${ID?} ${VERSION_CODENAME?} stable/v10" \
| tee /etc/apt/sources.list.d/teleport.list && apt-get update && apt-get install -y teleport && \
    rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/pip install dash_bootstrap_components gunicorn

# basic
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 

# Add local files as late as possible to avoid cache busting
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

RUN sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs

########## add the rest
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh

RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh

WORKDIR /


