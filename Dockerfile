FROM ubuntu:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&\
apt-get dist-upgrade -y &&\
apt-get install build-essential git python3 python3-pip -y

RUN cd /opt &&\
git clone https://github.com/pwndbg/pwndbg && \
cd pwndbg &&\
./setup.sh

RUN python3 -m pip install --upgrade pip && \
python3 -m pip install git+https://github.com/Gallopsled/pwntools.git@dev 