FROM base-kube_ubuntu20-v5

# For databases
RUN $CONDA_DIR/bin/pip install mysqlclient pymssql psycopg2 pymonetdb

# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*

# Jupyter enhancement
RUN  $CONDA_DIR/bin/conda install -c conda-forge 'jupyterlab>=3.0.0,<4.0.0a0'  
RUN  $CONDA_DIR/bin/pip install 'python-lsp-server[all]'
