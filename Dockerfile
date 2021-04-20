FROM debian:9
WORKDIR /app
RUN apt -y update && apt -y install sshpass
COPY . /app
RUN bash script.sh
CMD ["echo", "hello"]
