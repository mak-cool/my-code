FROM debian:9
WORKDIR /app
RUN sudo apt -y update && \
    sudo apt -y install ssh   
COPY . /app
RUN ssh -i id_rsa test@35.226.111.194 && \
    pwd  && \
    cd /home/makcool205/  && \
    bash value.sh
CMD ["echo", "hello"]
