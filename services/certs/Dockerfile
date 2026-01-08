FROM bitnami/kubectl:latest as kubectl_stage

FROM ubuntu:latest

#/etc/apt/sources.list.d/ubuntu.sources
#URIs: http://old-releases.ubuntu.com/ubuntu/

RUN apt update && \
    apt install -y certbot python3-certbot-dns-rfc2136 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=kubectl_stage /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

COPY incluster-kubeconfig.sh /usr/local/bin/incluster-kubeconfig.sh
RUN chmod +x /usr/local/bin/incluster-kubeconfig.sh

COPY update-cert.sh /usr/local/bin/update-cert.sh
RUN chmod +x /usr/local/bin/update-cert.sh

COPY update-cert-harica.sh /usr/local/bin/update-cert-harica.sh
RUN chmod +x /usr/local/bin/update-cert-harica.sh

COPY register-harica.sh /usr/local/bin/register-harica.sh
RUN chmod +x /usr/local/bin/register-harica.sh

COPY test-certs.sh /usr/local/bin/test-certs.sh
RUN chmod +x /usr/local/bin/test-certs.sh

ENTRYPOINT ["/usr/local/bin/incluster-kubeconfig.sh"]
CMD ["bash","-lc","sleep infinity"]

