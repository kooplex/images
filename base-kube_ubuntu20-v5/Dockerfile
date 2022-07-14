FROM base-conda_ubuntu20-v5

# Install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&\
    apt update && apt install -y kubectl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/pip install kubernetes
