FROM base_ubuntu20-v5

RUN apt update && apt install -y tmux curl curlftpfs \
 git python3-dev rsync python3-pip at &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN ls
RUN pip install sendmail 

#ENTRYPOINT ["service", "atd", "start", "&&", "bash"]
ENTRYPOINT service atd start && bash
