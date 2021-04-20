FROM debian:9
WORKDIR /app
RUN apt -y update && \
    apt -y install ssh  && \
    openssh-server
  
RUN echo “root:training” | chpasswd
RUN sed -i ‘s/prohibit-password/yes/’ /etc/ssh/sshd_config
ADD ssh.tar /root/
RUN chown -R root:root /root/.ssh;chmod -R 700 /root/.ssh
RUN echo “StrictHostKeyChecking=no” >> /etc/ssh/ssh_config
RUN mkdir /var/run/sshd  
 
COPY . /app
RUN ssh -i id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh
CMD ["echo", "hello"]
