FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y awscli curl git unzip wget

#JQ
RUN curl https://stedolan.github.io/jq/download/linux64/jq > /usr/bin/jq && chmod +x /usr/bin/jq
RUN ls -la /usr/bin/jq

RUN cd ~
COPY test.json test.json
RUN jq '.' test.json

#terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
RUN unzip terraform_0.11.8_linux_amd64.zip
RUN mv terraform /usr/local/bin/

RUN terraform --version 