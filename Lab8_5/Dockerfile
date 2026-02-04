FROM jenkins/jenkins:lts
USER root

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN pip3 install robotframework --break-system-packages

USER jenkins
