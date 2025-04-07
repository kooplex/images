FROM continuumio/miniconda3
FROM base-teleportv14.3.21_ubuntu24

FROM tensorflow/tensorflow:latest-gpu-jupyter
#FROM tensorflow/tensorflow@sha256:c70fc19788a8c11dd3d81bbeb492deb72a2d67b1875759366b96ed6821264eca

USER root

# configure apt frontent
ENV DEBIAN_FRONTEND noninteractive

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
# Install NFS client ACL manipulation

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      wget \
      bzip2 \
      ca-certificates \
      sudo vim\
      locales nfs-common acl nfs4-acl-tools tzdata \
      libnss-ldapd \
      openldap-utils \
      ldap-client \
      libldap2-dev \
 tmux curl curlftpfs \
 liblapack-dev libblas-dev \
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
  links2 \
 autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev \
 g++ libicu-dev libxml2-dev \
 libscalapack-mpi-dev \
 texlive-xetex texlive-lang-european texlive-science libmysqlclient-dev\
 python3-dev libpq-dev \
 liblapack-dev liblapack-doc liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr-dev libblas-test \
 less openjdk-8-source openjdk-8-jre gzip zlib1g-dev libpng-dev\
 make gcc ssh python3-dev libpq-dev cutadapt\
 rsync netcat-openbsd at\
 snakemake autoconf automake libtool zlib1g-dev systemd && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
 nvidia-driver-550 nvidia-utils-550 &&\
    rm -rf /var/lib/apt/lists/*

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY --from=0 /opt/conda /opt/conda
#RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudatoolkit=11.2 && ${CONDA_DIR}/bin/conda install -y pip && ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudnn=8.* cudatoolkit=11.8.0 && \
#RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudatoolkit=11.8.0 cudnn=8.6.* && \
#RUN apt-get update && apt-get install -y --no-install-recommends    libcudnn8-dev libcudnn8 &&     rm -rf /var/lib/apt/lists/* 
#RUN   ${CONDA_DIR}/bin/pip install tensorflow[and-cuda] nvidia-cudnn-cu11

#RUN ${CONDA_DIR}/bin/conda install -y jupyter
RUN   ${CONDA_DIR}/bin/pip install matplotlib seaborn
RUN   ${CONDA_DIR}/bin/pip install pandas  scikit-learn scikit-learn-intelex xgboost specio
#RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge cudatoolkit=11.7.0 cudnn==8.9.*
#RUN mkdir -p /usr/local/cuda/nvvm/libdevice && cp /opt/conda/pkgs/cudatoolkit-11.7.0-hd8887f6_10/lib/libdevice.10.bc /usr/local/cuda/nvvm/libdevice/libdevice.10.bc
#RUN apt-get update && apt-get install -y --no-install-recommends    nvidia-cuda-toolkit &&     rm -rf /var/lib/apt/lists/* 
#
#ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CONDA_DIR/lib/:/opt/conda/lib/python3.11/site-packages/nvidia/cudnn/lib/:/usr/lib/x86_64-linux-gnu/
#
##RUN $CONDA_DIR/bin/conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia &&\
##    $CONDA_DIR/bin/conda clean --packages
#
##RUN $CONDA_DIR/bin/conda create -n pytorch python==3.10.* 
##RUN . $CONDA_DIR/bin/activate && activate pytorch && conda update -y conda && conda install pytorch torchvision torchaudio pytorch-cuda -c pytorch -c nvidia &&\
##    $CONDA_DIR/bin/conda clean --packages
#
RUN $CONDA_DIR/bin/pip install transformers
RUN $CONDA_DIR/bin/pip install notebook


RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
#RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
#    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
#    mv tini /usr/local/bin/tini && \
#    chmod +x /usr/local/bin/tini

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

RUN mkdir /root/.ssh
RUN chmod 0600 /root/.ssh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package


#RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
#    apt install --yes nodejs 

# For databases
#RUN pip3 install mysqlclient pymssql psycopg2 pymonetdb pandas>=1.4.* \
#	dash_bootstrap_components gunicorn\
#	jupyter-book

COPY --from=1 /usr/local/bin/teleport /usr/local/bin/teleport

# Jupyter specific settings and templates
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
ADD etc/kooplex-logo.png /opt/conda/lib/python3.12/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.12/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh



WORKDIR /
RUN $CONDA_DIR/bin/pip install ipython_genutils entrypoints
RUN $CONDA_DIR/bin/conda install nb_conda_kernels

