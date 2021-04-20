FROM kroniak/ssh-client:3.9
COPY . /app
RUN apk update
WORKDIR /app
RUN ls -al
RUN pwd
RUN chmod 600 ./id_rsa
RUN ssh -t -t -i ./id_rsa test@35.224.153.219 && \
    pwd  && \
    cd /home/makcool205/  && \
    touch dockerfile
CMD ["echo","hello"]
