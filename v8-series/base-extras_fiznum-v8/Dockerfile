FROM base-teleportv14.3.21_ubuntu24

FROM base-config_fiznum-v8

COPY --from=0 /usr/local/bin/teleport /usr/local/bin/teleport

RUN  conda install -c conda-forge -y  nb_conda_kernels

WORKDIR /opt
