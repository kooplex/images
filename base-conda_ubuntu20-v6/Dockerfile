FROM continuumio/anaconda3

FROM base-config_ubuntu20-v6


COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda


# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Jupyter enhancement
RUN  $CONDA_DIR/bin/conda install -c conda-forge  jupyter-lsp-python jupyterlab jupyterlab-lsp
RUN  $CONDA_DIR/bin/pip install 'python-lsp-server[all]'

# For databases
RUN $CONDA_DIR/bin/pip install mysqlclient pymssql psycopg2 pymonetdb pandas>=1.4.*


