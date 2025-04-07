FROM base-bioinf_ubuntu20-v6

ENV NVARCH=x86_64
#ENV NVIDIA_REQUIRE_CUDA=cuda>=11.7
ENV NVIDIA_DISABLE_REQUIRE 1
ENV NV_CUDA_CUDART_VERSION=11.7.99-1
RUN apt-get update && apt-get install -y --no-install-recommends     gnupg2 curl ca-certificates &&     curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${NVARCH}/3bf863cc.pub | apt-key add - &&     echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${NVARCH} /" > /etc/apt/sources.list.d/cuda.list &&     apt-get purge --autoremove -y curl     && rm -rf /var/lib/apt/lists/* # buildkit
ENV CUDA_VERSION=11.7.1

RUN apt-get update && apt-get install -y --no-install-recommends     cuda-cudart-11-7=${NV_CUDA_CUDART_VERSION}     ${NV_CUDA_COMPAT_PACKAGE}     && ln -s cuda-11.7 /usr/local/cuda &&     rm -rf /var/lib/apt/lists/* # buildkit
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf     && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf # buildkit
ENV PATH=${PATH}/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NV_CUDA_LIB_VERSION=11.7.1-1

ENV NV_NVTX_VERSION=11.7.91-1
ENV NV_LIBNPP_VERSION=11.7.4.75-1
ENV NV_LIBNPP_PACKAGE=libnpp-11-7=11.7.4.75-1
ENV NV_LIBCUSPARSE_VERSION=11.7.4.91-1
ENV NV_LIBCUBLAS_PACKAGE_NAME=libcublas-11-7
ENV NV_LIBCUBLAS_VERSION=11.10.3.66-1
ENV NV_LIBCUBLAS_PACKAGE=libcublas-11-7=11.10.3.66-1
ENV NV_LIBNCCL_PACKAGE_NAME=libnccl2
ENV NV_LIBNCCL_PACKAGE_VERSION=2.12.12-1
ENV NCCL_VERSION=2.12.12-1
ENV NV_LIBNCCL_PACKAGE=libnccl2=2.12.12-1+cuda11.7
ENV NV_DRIVER_VER=515.105.01-0ubuntu1
RUN apt-get update && apt-get install -y --no-install-recommends nvidia-driver-515=${NV_DRIVER_VER} libnvidia-compute-515=${NV_DRIVER_VER} libnvidia-fbc1-515=${NV_DRIVER_VER} libnvidia-cfg1-515=${NV_DRIVER_VER} libnvidia-gl-515=${NV_DRIVER_VER} \
 nvidia-dkms-515=${NV_DRIVER_VER}  libnvidia-extra-515=${NV_DRIVER_VER} nvidia-kernel-source-515=${NV_DRIVER_VER}\
  libnvidia-compute-515=${NV_DRIVER_VER} libnvidia-decode-515=${NV_DRIVER_VER} libnvidia-encode-515=${NV_DRIVER_VER} \
 nvidia-compute-utils-515=${NV_DRIVER_VER} nvidia-utils-515=${NV_DRIVER_VER} xserver-xorg-video-nvidia-515=${NV_DRIVER_VER}\
 libnvidia-common-515=${NV_DRIVER_VER}  nvidia-kernel-common-515=${NV_DRIVER_VER} \
    cuda-libraries-11-7=${NV_CUDA_LIB_VERSION}     ${NV_LIBNPP_PACKAGE}     cuda-nvtx-11-7=${NV_NVTX_VERSION}     libcusparse-11-7=${NV_LIBCUSPARSE_VERSION}     ${NV_LIBCUBLAS_PACKAGE}     ${NV_LIBNCCL_PACKAGE}     && rm -rf /var/lib/apt/lists/* # buildkit


RUN pip install --upgrade pip && pip install ont-bonito

RUN rm /opt/conda/lib/libzip.so && ln -s /usr/lib/jvm/java-17-openjdk-amd64/lib/libzip.so /opt/conda/lib/libzip.so

COPY etc/ont_guppy_6.3.8-1~focal_amd64.deb /opt/ont_guppy_6.3.8-1~focal_amd64.deb
#COPY //lhome/fonok/images/Tools/OxfordNanopore-guppy/ont_guppy_6.3.8-1~focal_amd64.deb /opt/ont_guppy_6.3.8-1~focal_amd64.deb

RUN apt-get update && apt-get install -y --no-install-recommends     libzmq5   && rm -rf /var/lib/apt/lists/* # buildkit
RUN dpkg -i /opt/ont_guppy_6.3.8-1~focal_amd64.deb 

WORKDIR /opt
# INstall Nanopore Taiyaki
#RUN $CONDA_DIR/bin/conda create -n taiyaki python==3.11.* ipykernel 
#RUN . $CONDA_DIR/bin/activate && activate taiyaki && conda update -y conda && conda install pytorch torchvision torchaudio pytorch-cuda -c pytorch -c nvidia &&\
#    $CONDA_DIR/bin/conda clean --packages

# As a virtualenv with it's own Makefile
RUN wget https://codeload.github.com/nanoporetech/taiyaki/zip/refs/heads/master && mv master taiyaki.zip && unzip taiyaki.zip  && rm taiyaki.zip 
RUN cd taiyaki-master && make deps 
#RUN cd taiyaki-master &&  make install 
RUN cd taiyaki-master &&  python3 setup.py install 

#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 
#WORKDIR /
