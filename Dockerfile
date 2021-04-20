FROM debian:9
WORKDIR /app
RUN apt -y update && apt -y install sshpass
COPY . /app
CMD ["bash", "script.sh"]
