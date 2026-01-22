FROM continuumio/anaconda3:2024.10-1

FROM base_ubuntu24-v9

COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda


# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV CARGO_HOME "/usr/local/bin/"
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH $PATH:$CARGO_HOME/bin

RUN  pip install \
	 ipython-sql jupyterlab_latex jupyter_copilot \
	"ipywidgets>=8.0" nbclassic

## For databases
RUN pip install  mysqlclient pymssql psycopg2 pymonetdb sqlalchemy


