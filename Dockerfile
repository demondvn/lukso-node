FROM docker:git

RUN apk update && apk add sudo curl wget py3-pip
# RUN usermod -aG sudo 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
RUN pip install 'docker-compose==1.8.0'
RUN docker-compose --version
RUN curl https://github.com/lukso-network/tools-lukso-cli-deprecated/releases/download/v0.4.4/lukso-cli-linux-amd64 -o /usr/local/bin/lukso
# RUN lukso -v && lukso network init --chain l16
# CMD lukso network start
WORKDIR app
COPY script.sh script.sh
RUN chmod +x script.sh /usr/local/bin/lukso && ls
CMD ./script.sh
