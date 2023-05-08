FROM jenkins/jenkins:latest

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install bzt && \
    pip3 install virtualenv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
