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
#RUN bash -c "dpkg -l | grep nvidia"
RUN apt-get update && apt-get install -y --no-install-recommends nvidia-driver-515     cuda-libraries-11-7=${NV_CUDA_LIB_VERSION}     ${NV_LIBNPP_PACKAGE}     cuda-nvtx-11-7=${NV_NVTX_VERSION}     libcusparse-11-7=${NV_LIBCUSPARSE_VERSION}     ${NV_LIBCUBLAS_PACKAGE}     ${NV_LIBNCCL_PACKAGE}     && rm -rf /var/lib/apt/lists/* # buildkit

