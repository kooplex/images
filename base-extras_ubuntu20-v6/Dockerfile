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
