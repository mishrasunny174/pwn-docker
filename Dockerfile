FROM ubuntu:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8
ENV TZ=Asia/Kolkata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL maintainer="mishrasunny174@gmail.com"

RUN dpkg --add-architecture i386

RUN apt-get update &&\
apt-get dist-upgrade -y &&\
apt-get install -y ruby \
build-essential \
git \
python3 \
python3-pip \
ipython3 \
libc6:i386 \
libncurses5:i386 \
libstdc++6:i386 \
socat \
tmux \
strace \
ltrace \
libcapstone-dev \
seccomp \
ruby-dev \
radare2 \
xxd \
netcat  \
iproute2 \
vim \
elfutils \
sudo \
binutils-common \
patchelf && \
rm -rf /var/lib/apt/lists/*

RUN gem install one_gadget seccomp-tools

RUN cd /opt &&\
git clone --depth 1 --recurse-submodules https://github.com/pwndbg/pwndbg && \
cd pwndbg &&\
./setup.sh

RUN python3 -m pip install --upgrade pip && \
python3 -m pip install shellen ropgadget && \
python3 -m pip install git+https://github.com/Gallopsled/pwntools.git@dev


COPY configs/ /root/

RUN git clone https://github.com/mishrasunny174/libc-debug-build.git /opt/libc-debug-build

CMD [ "tmux", "-u", "new", "-s" ,"pwn"]
