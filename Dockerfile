FROM debian:latest

RUN apt-get update -y 
RUN apt-get install -y wget unzip
RUN wget https://releases.hashicorp.com/vault/0.6.5/vault_0.6.5_linux_amd64.zip
RUN unzip vault_0.6.5_linux_amd64.zip -d bin/  && rm -rf vault_0.6.5_linux_amd64.zip

ENV PATH=$PATH:/bin
ENV VAULT_VERSION=0.6.5

EXPOSE 8200
VOLUME /vault

COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
