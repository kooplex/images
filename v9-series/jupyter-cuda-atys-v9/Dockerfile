FROM jupyter-basic-v9

ENV NVARCH x86_64

RUN apt-get update && apt-get install -y --no-install-recommends openslide-tools nvidia-driver-570 \
libnvidia-gl-570 nvidia-dkms-570 nvidia-kernel-common-570 \
nvidia-kernel-source-570 libnvidia-compute-570 libnvidia-extra-570 nvidia-compute-utils-570 \ 
libnvidia-decode-570 libnvidia-encode-570 nvidia-utils-570 xserver-xorg-video-nvidia-570 libnvidia-cfg1-570 libnvidia-fbc1-570 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/${NVARCH}/3bf863cc.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/${NVARCH} /" > /etc/apt/sources.list.d/cuda.list && \
    rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get install -y --no-install-recommends \
#    cuda-cudart \
#    cuda-compat \
#    && rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get install -y --no-install-recommends \
#    cuda-libraries-12-5=${NV_CUDA_LIB_VERSION} \
#    cuda-toolkit-12-5=${NV_CUDA_LIB_VERSION} \
#    ${NV_LIBNPP_PACKAGE} \
#    cuda-nvtx-12-5=${NV_NVTX_VERSION} \
#    libcusparse-12-5=${NV_LIBCUSPARSE_VERSION} \
#    ${NV_LIBCUBLAS_PACKAGE} \
#    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries \
    cuda-toolkit \
    libnpp libcublas \
    cuda-nvtx \
    libcusparse \
    && rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
    && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility




ENV NVIDIA_PRODUCT_NAME="CUDA"

RUN $CONDA_DIR/bin/pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124 

RUN $CONDA_DIR/bin/pip install transformers

#ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
#ADD etc/entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y --no-install-recommends openslide-tools nvidia-driver-550=550.90.07-0ubuntu1 \
libnvidia-gl-550=550.90.07-0ubuntu1 nvidia-dkms-550=550.90.07-0ubuntu1 nvidia-kernel-common-550=550.90.07-0ubuntu1 \
nvidia-kernel-source-550=550.90.07-0ubuntu1 libnvidia-compute-550=550.90.07-0ubuntu1 libnvidia-extra-550=550.90.07-0ubuntu1 nvidia-compute-utils-550=550.90.07-0ubuntu1 \ 
libnvidia-decode-550=550.90.07-0ubuntu1 libnvidia-encode-550=550.90.07-0ubuntu1 nvidia-utils-550=550.90.07-0ubuntu1 xserver-xorg-video-nvidia-550=550.90.07-0ubuntu1 libnvidia-cfg1-550=550.90.07-0ubuntu1 libnvidia-fbc1-550=550.90.07-0ubuntu1 \
    && rm -rf /var/lib/apt/lists/*
#RUN apt-get update && apt-get install -y --no-install-recommends python-openslide \
#    && rm -rf /var/lib/apt/lists/*
#RUN . /opt/python-packages/bin/activate && uv pip install openslide-python
#RUN pip install openslide-python

RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge -c anaconda -c nvidia cudatoolkit cudnn
RUN apt-get update && apt-get install -y --no-install-recommends    libcudnn-dev libgsl-dev nvidia-container-toolkit &&     rm -rf /var/lib/apt/lists/* 
WORKDIR /
