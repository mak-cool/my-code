FROM kroniak/ssh-client:3.9
COPY . /app
RUN yum update
WORKDIR /app
RUN ls -al
RUN pwd
RUN ssh -i id_rsa -s test@35.226.111.194 && \
RUN ssh -tti id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh
CMD ["echo","hello"]
