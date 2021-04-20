FROM ubuntu:latest
WORKDIR /app
COPY . /app
RUN ls -al
RUN apt -y update && apt -y install curl && apt -y install wget && apt install -y gnupg2
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
RUN gcloud auth activate-service-account test-sa@shaped-canyon-288212.iam.gserviceaccount.com  --key-file=./shaped-canyon-288212-aa9e51d5fd8e.json --project=shaped-canyon-288212
#RUN gcloud components update
RUN apt -y update 
RUN apt -y --only-upgrade install google-cloud-sdk-bigtable-emulator google-cloud-sdk-app-engine-grpc google-cloud-sdk-app-engine-go google-cloud-sdk-skaffold kubectl google-cloud-sdk-local-extract google-cloud-sdk-pubsub-emulator google-cloud-sdk-config-connector google-cloud-sdk-datalab google-cloud-sdk-datastore-emulator google-cloud-sdk-app-engine-python google-cloud-sdk-firestore-emulator google-cloud-sdk-kubectl-oidc google-cloud-sdk-anthos-auth google-cloud-sdk google-cloud-sdk-cbt google-cloud-sdk-app-engine-java google-cloud-sdk-cloud-build-local google-cloud-sdk-kpt google-cloud-sdk-app-engine-python-extras google-cloud-sdk-minikube
RUN gcloud compute instances list
RUN gcloud compute ssh test@instance-2 --zone=us-central1-a --ssh-key-file=./id_rsa
RUN pwd && \
    ls -al && \
    cd /home/makcool205 && \
    touch test && \
    ls -al
CMD ["echo","hello"]

