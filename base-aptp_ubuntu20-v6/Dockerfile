FROM base_ubuntu20-v5

RUN apt update && apt install -y --no-install-recommends tmux curl curlftpfs \
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
 liblapack-dev liblapack-doc liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr libblasr-dev libblas-test \
 less openjdk-8-source openjdk-8-jre gzip zlib1g-dev libpng-dev\
 make gcc ssh python3-dev libpq-dev cutadapt\
 rsync netcat-openbsd at\
 texlive-formats-extra texlive-plain-generic \
 snakemake autoconf automake libtool zlib1g-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt install --yes nodejs 

