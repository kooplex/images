FROM base-teleportv14.3.21_ubuntu24

FROM base-config_cuml_ubuntu22-v8

# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*

# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

## SLURM 
#RUN apt update && apt install -y --no-install-recommends slurm-client  &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=0 /usr/local/bin/teleport /usr/local/bin/teleport

RUN $CONDA_DIR/bin/pip install dash_bootstrap_components gunicorn

RUN $CONDA_DIR/bin/pip install jupyter-book
RUN $CONDA_DIR/bin/conda install -y -c conda-forge nb_conda_kernels

WORKDIR /opt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.296/quarto-1.3.296-linux-amd64.deb &&\
    dpkg -i  quarto-1.3.296-linux-amd64.deb && rm quarto-1.3.296-linux-amd64.deb
