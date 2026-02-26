FROM continuumio/anaconda3:2024.06-1
FROM base_ubuntu24uv-v10

COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda

COPY etc/grogupy-0.3.1-py3-none-any.whl /root/grogupy-0.3.1-py3-none-any.whl

RUN . /opt/conda/bin/activate &&\
    conda install python=3.12.4 siesta=5.4.0=mpi_openmpi_h9970ea6_0 -c conda-forge &&\
    pip install magnopy tqdm /root/grogupy-0.3.1-py3-none-any.whl matplotlib magnopy[visual] \
    ipykernel 

#RUN . /opt/conda/bin/activate &&\
#    cd /root/ && apt update && apt install -y --no-install-recommends openmpi-bin libmpich-dev libopenmpi-dev &&\
#    apt clean && rm -rf /var/lib/apt/lists/* &&\
#    git clone https://github.com/richard-evans/vampire.git && cd ./vampire/ &&\
#    git checkout -b integration &&\
#    make serial -j 16 && make parallel -j 16 &&\
#    mv /usr/bin/g++ /usr/bin/g++-real &&\
#    echo '#!/bin/bash' > /usr/bin/g++ &&\
#    echo 'exec /usr/bin/g++-real -include cstdint "$@"' >> /usr/bin/g++ &&\
#    chmod +x /usr/bin/g++ &&\
#    sed -i s,sudo,, makefile &&\
#    make -C util/vdc &&\
#    mkdir -p /etc/paths.d && make install &&\
#    mv /usr/bin/g++-real /usr/bin/g++ &&\
#    rm -rf /root/vampire
#WORKDIR /
#
#EXPOSE 8888
#ENV PATH $PATH:/opt/vampire/bin
