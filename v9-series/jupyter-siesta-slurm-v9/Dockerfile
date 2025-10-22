FROM image-registry.vo.elte.hu/jupyter-v9

WORKDIR /

RUN conda create -n siesta python=3.12.4 siesta=5.4.0=mpi_openmpi_h9970ea6_0 -c conda-forge

RUN apt update && apt install -y liblua5.4-0 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* &&\
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.4.so.0 /usr/lib/x86_64-linux-gnu/liblua.so.5.4

WORKDIR /root/
RUN cd /root/ && apt update && apt install -y --no-install-recommends openmpi-bin libmpich-dev libopenmpi-dev &&\
    apt clean && rm -rf /var/lib/apt/lists/* &&\
    git clone https://github.com/richard-evans/vampire.git && cd ./vampire/ &&\
    git checkout -b integration &&\
    make serial -j 16 && make parallel -j 16 &&\
    mv /usr/bin/g++ /usr/bin/g++-real &&\
    echo '#!/bin/bash' > /usr/bin/g++ &&\
    echo 'exec /usr/bin/g++-real -include cstdint "$@"' >> /usr/bin/g++ &&\
    chmod +x /usr/bin/g++ &&\
    make -C util/vdc &&\
    mkdir -p /etc/paths.d && make install &&\
    mv /usr/bin/g++-real /usr/bin/g++ &&\
    rm -rf /root/vampire

# SLURM 
RUN apt update && apt install -y --no-install-recommends slurm-client  &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /
