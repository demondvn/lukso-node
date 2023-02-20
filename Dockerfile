FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl
RUN usermod -aG sudo && \ 
 echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers  \
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN docker-compose --version
RUN mkdir lukso-l16-testnet && cd lukso-l16-testnet && curl https://install.l16.lukso.network | sudo bash
RUN lukso -v && lukso network init --chain l16
CMD lukso network start
