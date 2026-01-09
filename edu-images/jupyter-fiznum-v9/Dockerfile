FROM base-jupyter_ubuntu24-v9

#RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
#RUN sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt update && apt install -y --no-install-recommends tmux curl \
	clang libclang-dev libclang-cpp-dev zip xxd bc mc &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install ahkab schemdraw opencv-python
RUN pip install matplotlib seaborn




