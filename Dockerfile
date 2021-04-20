FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN ls -al
RUN apt -y update && apt -y install curl && apt -y install wget && apt install -y gnupg2
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
RUN gcloud auth activate-service-account test-sa@shaped-canyon-288212.iam.gserviceaccount.com  --key-file=./shaped-canyon-288212-aa9e51d5fd8e.json --project=test1
RUN gcloud compute instances list
CMD ["echo","hello"]

