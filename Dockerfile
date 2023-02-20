FROM docker:git

RUN apk update && apk add sudo curl wget
# RUN usermod -aG sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN docker-compose --version
WORKDIR lukso-l16-testnet
RUN curl https://install.l16.lukso.network | sudo bash
# RUN lukso -v && lukso network init --chain l16
# CMD lukso network start
COPY script.sh script.sh
RUN chmod +x script.sh
CMD ./script.sh
