FROM kroniak/ssh-client:3.9
COPY . /app
RUN apt update && apt install  openssh-server sudo -y
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
WORKDIR /app
RUN ls -al
RUN pwd
RUN ssh -i id_rsa -s test@35.226.111.194 && \
RUN ssh -tti id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh
