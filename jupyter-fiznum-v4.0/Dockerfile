FROM base_ubuntu20-v4.0

RUN apt update && apt install -y tmux curl curlftpfs \
 liblapack-dev libblas-dev \
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
 inotify-tools \
 autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev \
 g++-9 libicu-dev libxml2-dev \
 libscalapack-mpi-dev \
 texlive-xetex texlive-lang-european texlive-science libmysqlclient-dev\
 python3-dev libpq-dev \
 liblapack-dev liblapack-doc  liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr libblasr-dev libblas-test \
 less gzip zlib1g-dev libpng-dev\
 make gcc ssh python3-dev libpq-dev cutadapt \
 rsync snakemake \
 autoconf automake libtool zlib1g-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt install --yes nodejs 

# Install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&\
    apt update && apt install -y kubectl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /opt

# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create conda dir
RUN mkdir -p $CONDA_DIR

# Install conda
RUN cd /tmp && \
    mkdir -p $CONDA_DIR && \
    ANACONDA="Anaconda3-2020.07-Linux-x86_64.sh" && \
    wget --quiet https://repo.anaconda.com/archive/${ANACONDA} && \
    #FIXME: check sum
    /bin/bash ${ANACONDA} -f -b -p $CONDA_DIR && \
    rm ${ANACONDA} && $CONDA_DIR/bin/conda clean --yes --all

RUN $CONDA_DIR/bin/conda update -y conda

RUN $CONDA_DIR/bin/pip install pymysql pymssql psycopg2

RUN $CONDA_DIR/bin/conda install -c conda-forge ffmpeg 

RUN $CONDA_DIR/bin/pip install opencv-python

RUN $CONDA_DIR/bin/conda install -y --override-channels -c conda-forge  plotly 
RUN $CONDA_DIR/bin/pip install schemdraw 
RUN $CONDA_DIR/bin/pip install ahkab  
RUN $CONDA_DIR/bin/pip install --ignore-installed  kubernetes pymonetdb

# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*
#RUN apt update && apt install -y tmux curl curlftpfs \
# apt-get clean && rm -rf /var/lib/apt/lists/*


# basic
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 

# Add local files as late as possible to avoid cache busting
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

RUN sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs

########## add the rest
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh

RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh

WORKDIR /


