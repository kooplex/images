FROM base-teleportv14.3.21_ubuntu24

FROM base-config_ubuntu24-v9

## git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo os=ubuntu dist=jammy bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*
#
## SLURM 
##RUN apt update && apt install -y --no-install-recommends slurm-client  &&\
## apt-get clean && rm -rf /var/lib/apt/lists/*
#
COPY --from=0 /usr/local/bin/teleport /usr/local/bin/teleport
#
##RUN . /opt/python-packages/bin/activate && uv pip install dash_bootstrap_components gunicorn jupyter-book pandoc
RUN pip install gunicorn jupyter-book pandoc
RUN  conda install nb_conda_kernels
#
#WORKDIR /opt
#
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.296/quarto-1.3.296-linux-amd64.deb &&\
    dpkg -i  quarto-1.3.296-linux-amd64.deb && rm quarto-1.3.296-linux-amd64.deb
