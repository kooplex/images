FROM continuumio/anaconda3:2023.09-0

FROM base-aptp_ubuntu24-v8

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
RUN  $CONDA_DIR/bin/conda install -c conda-forge jupyterlab 

# For databases
RUN pip install "numpy<2.0" mysqlclient pymssql psycopg2 pymonetdb "pandas>=2.0" 'python-lsp-server[all]' \
    notebook sqlalchemy \
    poetry poetry-kernel ipython-sql jupyterlab_latex  \
    "ipywidgets>=8.0" nbclassic 


