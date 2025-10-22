FROM jupyter-basic-v5

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

# !!! SHOULD BE COMPATIBLE WITH THE HOST DRIVERS
RUN apt-get update && apt-get install -y --no-install-recommends     libzmq5 libnvidia-compute-470    && rm -rf /var/lib/apt/lists/* # buildkit
#RUN apt-get update && apt-get install -y --no-install-recommends nvidia-driver-515     cuda-libraries-11-7=${NV_CUDA_LIB_VERSION}     ${NV_LIBNPP_PACKAGE}     cuda-nvtx-11-7=${NV_NVTX_VERSION}     libcusparse-11-7=${NV_LIBCUSPARSE_VERSION}     ${NV_LIBCUBLAS_PACKAGE}     ${NV_LIBNCCL_PACKAGE}     && rm -rf /var/lib/apt/lists/* # buildkit
#RUN TARGETARCH=arm64 /bin/sh -c apt-mark hold ${NV_LIBCUBLAS_PACKAGE_NAME} ${NV_LIBNCCL_PACKAGE_NAME} # buildkit

#ENV NVIDIA_REQUIRE_CUDA=cuda #>=11.7
# Jupyter specific settings and templates
#ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
#ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png
#
#ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
#ADD etc/entrypoint.sh /entrypoint.sh
#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh
#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 

WORKDIR /
