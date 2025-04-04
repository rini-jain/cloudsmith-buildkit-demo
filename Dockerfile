
FROM ubuntu:latest
WORKDIR /app


RUN apt-get update && apt-get install -y wget unzip


RUN --mount=type=secret,id=cloudsmith_token \
    token=$(cat /run/secrets/cloudsmith_token) && \
    wget --header="Authorization: Bearer $token" \
         -O Rini.py.zip \
         "https://dl.cloudsmith.io/private/rini-jain-rnye/hi/raw/files/Rini.py.zip" && \
    unzip Rini.py.zip && \
    rm Rini.py.zip
