FROM base-jupyterlab_ubuntu20-v6

# SLURM 
RUN pip install jupyterlab_slurm pandas

RUN  $CONDA_DIR/bin/conda install -c conda-forge  jupyterlab-git
#RUN  $CONDA_DIR/bin/conda install -c conda-forge jupyterlab-lsp jupyter-lsp-python 

#RUN pip install jupyter_ai
#RUN pip install jupyter_server

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh

WORKDIR /

