FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl golang-go wget sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN wget https://github.com/lukso-network/tools-lukso-cli-deprecated/releases/download/v0.4.4/lukso-cli-linux-amd64 -O /usr/local/bin/lukso
# RUN lukso -v && lukso network init --chain l16
# CMD lukso network start
WORKDIR app
COPY script.sh script.sh
RUN chmod +x script.sh /usr/local/bin/lukso 
CMD ./script.sh && sleep 3600
