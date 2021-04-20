FROM ubuntu:latest
COPY . /app
RUN apt update && apt install  openssh-server sudo -y
RUN service ssh start
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

WORKDIR /app

RUN ssh -i id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh

