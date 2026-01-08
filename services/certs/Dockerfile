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

COPY --chmod=0755 incluster-kubeconfig.sh update-cert.sh update-cert-harica.sh register-harica.sh test-certs.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/incluster-kubeconfig.sh"]
CMD ["bash","-lc","sleep infinity"]

