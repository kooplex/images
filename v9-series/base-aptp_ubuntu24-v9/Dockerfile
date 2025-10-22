FROM base_ubuntu24-v9

# INSTALL NODEJS
ENV NODE_MAJOR=20
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

RUN apt update && apt install -y --no-install-recommends tmux curl \
 liblapack-dev libblas-dev sshfs\
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev cmake \
  links2 \
 autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev \
 g++ libicu-dev libxml2-dev \
 libscalapack-mpi-dev \
 texlive-xetex texlive-lang-european texlive-science libmysqlclient-dev\
 python3-dev libpq-dev python3-gdbm \
 liblapack-dev liblapack-doc  liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr-dev libblas-test \
 less gzip zlib1g-dev libpng-dev\
 make gcc ssh python3-dev libpq-dev cutadapt\
 rsync netcat-openbsd at zip bc xxd \
 nodejs unzip mc\
 snakemake autoconf automake libtool zlib1g-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*


