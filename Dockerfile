FROM debian:latest

RUN apt-get update -y 
RUN apt-get install -y wget unzip git
RUN wget https://releases.hashicorp.com/vault/0.6.5/vault_0.6.5_linux_amd64.zip
RUN unzip vault_0.6.5_linux_amd64.zip -d bin/  && rm -rf vault_0.6.5_linux_amd64.zip

RUN git clone https://github.com/FlorianJDF/vault-docker.git
RUN mkdir -p /vault/config
RUN cp vault-docker/config/* /vault/config
RUN rm -rf vault-docker

ENV PATH=$PATH:/bin
ENV VAULT_VERSION=0.6.5

EXPOSE 8200
VOLUME /vault

ENTRYPOINT ["vault"]
CMD ["server", "-config=/vault/config/vault-configuration.hcl"]
