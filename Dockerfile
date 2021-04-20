FROM debian:9
WORKDIR /app
RUN apt -y update
COPY . /app
RUN ssh -i id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh
CMD ["echo", "hello"]
