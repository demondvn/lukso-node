FROM docker:git

RUN apk update && apk add sudo curl wget py3-pip
# RUN usermod -aG sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
RUN pip install 'docker-compose==1.8.0'
RUN docker-compose --version
WORKDIR lukso-l16-testnet
RUN curl https://install.l16.lukso.network -o installer.sh && chmod +x installer.sh && ./installer.sh
# RUN lukso -v && lukso network init --chain l16
# CMD lukso network start
COPY script.sh script.sh
RUN chmod +x script.sh
CMD ./script.sh
