FROM vllm/vllm-openai

RUN apt update && apt install -y --no-install-recommends curl gpg &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

#ADD etc/main.py /opt/main.py
RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey   \
    |  gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg && \
	curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | tee /etc/apt/sources.list.d/nvidia-container-toolkit.list && apt-get update && \
   apt-get install -y nvidia-container-toolkit

WORKDIR /

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x   /entrypoint.sh
