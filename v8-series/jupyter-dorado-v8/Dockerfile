FROM jupyter-basic-cuda-v8 as base

WORKDIR /opt 
RUN wget https://cdn.oxfordnanoportal.com/software/analysis/dorado-0.8.0-linux-x64.tar.gz && \
    tar -xf dorado-0.8.0-linux-x64.tar.gz && \
    rm dorado-0.8.0-linux-x64.tar.gz

WORKDIR /
