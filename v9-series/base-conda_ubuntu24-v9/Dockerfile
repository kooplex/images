FROM continuumio/anaconda3:2024.10-1

FROM base-aptp_ubuntu24-v9

COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda


# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN ls
ENV CARGO_HOME "/usr/local/bin/"
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH $PATH:$CARGO_HOME/bin
##RUN /usr/local/bin/uv venv /opt/python-packages
##RUN . /opt/python-packages/bin/activate && uv pip install jupyterlab
#
## Jupyter enhancement
#RUN  $CONDA_DIR/bin/conda install -c conda-forge jupyterlab 
##RUN . /opt/python-packages/bin/activate && uv pip install  'python-lsp-server[all]'
#
## For databases
##RUN . /opt/python-packages/bin/activate && uv pip install mysqlclient pymssql psycopg2 pymonetdb pandas>=1.4.*
RUN pip install  mysqlclient pymssql psycopg2 pymonetdb sqlalchemy


