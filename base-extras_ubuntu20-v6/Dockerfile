FROM base-teleportv12.0.2_ubuntu20

FROM base-conda_ubuntu20-v6

# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*

# SLURM 
RUN apt update && apt install -y --no-install-recommends slurm-client  &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=0 /usr/local/bin/teleport /usr/local/bin/teleport

RUN $CONDA_DIR/bin/pip install dash_bootstrap_components gunicorn

RUN $CONDA_DIR/bin/pip install jupyter-book
RUN $CONDA_DIR/bin/conda install -y -c conda-forge nb_conda_kernels

WORKDIR /opt

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.296/quarto-1.3.296-linux-amd64.deb &&\
    dpkg -i  quarto-1.3.296-linux-amd64.deb && rm quarto-1.3.296-linux-amd64.deb
