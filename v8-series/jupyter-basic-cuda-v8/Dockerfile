FROM jupyter-basic-v8 as base

ENV NVARCH x86_64

ENV NVIDIA_REQUIRE_CUDA "cuda>=12.5 brand=unknown,driver>=470,driver<471 brand=grid,driver>=470,driver<471 brand=tesla,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=vapps,driver>=470,driver<471 brand=vpc,driver>=470,driver<471 brand=vcs,driver>=470,driver<471 brand=vws,driver>=470,driver<471 brand=cloudgaming,driver>=470,driver<471 brand=unknown,driver>=535,driver<536 brand=grid,driver>=535,driver<536 brand=tesla,driver>=535,driver<536 brand=nvidia,driver>=535,driver<536 brand=quadro,driver>=535,driver<536 brand=quadrortx,driver>=535,driver<536 brand=nvidiartx,driver>=535,driver<536 brand=vapps,driver>=535,driver<536 brand=vpc,driver>=535,driver<536 brand=vcs,driver>=535,driver<536 brand=vws,driver>=535,driver<536 brand=cloudgaming,driver>=535,driver<536 brand=unknown,driver>=550,driver<551 brand=grid,driver>=550,driver<551 brand=tesla,driver>=550,driver<551 brand=nvidia,driver>=550,driver<551 brand=quadro,driver>=550,driver<551 brand=quadrortx,driver>=550,driver<551 brand=nvidiartx,driver>=550,driver<551 brand=vapps,driver>=550,driver<551 brand=vpc,driver>=550,driver<551 brand=vcs,driver>=550,driver<551 brand=vws,driver>=550,driver<551 brand=cloudgaming,driver>=550,driver<551"
ENV NV_CUDA_CUDART_VERSION 12.6

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/${NVARCH}/3bf863cc.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/${NVARCH} /" > /etc/apt/sources.list.d/cuda.list && \
    apt-get purge --autoremove -y curl \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_VERSION 12.6.1
ENV CUDA_VERSION 12.5.1

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-cache search cuda-cudart
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-12-5 \
    cuda-compat-12-5 \
    && rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
    && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64


# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility



ENV NV_CUDA_LIB_VERSION 12.5.1-1
#ENV NV_CUDA_LIB_VERSION 12.6.2-1

ENV NV_NVTX_VERSION 12.5.82-1
ENV NV_LIBNPP_VERSION 12.5.0.159-1
ENV NV_LIBNPP_PACKAGE libnpp-12-5
ENV NV_LIBCUSPARSE_VERSION 12.5.1.3-1
#ENV NV_NVTX_VERSION 12.6.77-1
#ENV NV_LIBNPP_VERSION 12.3.1.54-1
#ENV NV_LIBNPP_PACKAGE libnpp-12-6
#ENV NV_LIBCUSPARSE_VERSION 12.5.4.2-1

ENV NV_LIBCUBLAS_PACKAGE_NAME libcublas-12-5
ENV NV_LIBCUBLAS_VERSION 12.5.3.2-1
#ENV NV_LIBCUBLAS_PACKAGE_NAME libcublas-12-6
#ENV NV_LIBCUBLAS_VERSION 12.6.3.3-1
ENV NV_LIBCUBLAS_PACKAGE ${NV_LIBCUBLAS_PACKAGE_NAME}=${NV_LIBCUBLAS_VERSION}


RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-12-5=${NV_CUDA_LIB_VERSION} \
    cuda-toolkit-12-5=${NV_CUDA_LIB_VERSION} \
    ${NV_LIBNPP_PACKAGE} \
    cuda-nvtx-12-5=${NV_NVTX_VERSION} \
    libcusparse-12-5=${NV_LIBCUSPARSE_VERSION} \
    ${NV_LIBCUBLAS_PACKAGE} \
    && rm -rf /var/lib/apt/lists/*

# Keep apt from auto upgrading the cublas and nccl packages. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
RUN apt-mark hold ${NV_LIBCUBLAS_PACKAGE_NAME}

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
RUN pip install openslide-python

RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge -c anaconda -c nvidia cudatoolkit cudnn
RUN apt-get update && apt-get install -y --no-install-recommends    libcudnn-dev libgsl-dev nvidia-container-toolkit &&     rm -rf /var/lib/apt/lists/* 
WORKDIR /
