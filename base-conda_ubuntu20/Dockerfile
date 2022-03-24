FROM continuumio/anaconda3

FROM base_ubuntu20-##TAG##

RUN apt update && apt install -y tmux curl curlftpfs \
 liblapack-dev libblas-dev \
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
 inotify-tools \
 autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev \
 g++-9 libicu-dev libxml2-dev \
 libscalapack-openmpi-dev \
 texlive-xetex texlive-lang-european texlive-science libmysqlclient-dev\
 python3-dev libpq-dev \
 rsync \
 liblapack-dev liblapack-doc  liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr libblasr-dev libblas-test &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt install --yes nodejs 

COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda


# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


# Install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&\
    apt update && apt install -y kubectl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/pip install kubernetes

