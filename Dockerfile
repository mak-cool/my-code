FROM kroniak/ssh-client:3.9
COPY . /app
RUN apk update
WORKDIR /app
RUN ls -al
RUN pwd
RUN ssh -t -t -i id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    touch dockerfile
CMD ["echo","hello"]
