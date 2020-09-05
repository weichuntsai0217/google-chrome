From ubuntu:16.04

RUN apt-get update && apt-get install -y xauth wget fontconfig fonts-arphic-uming

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=Asia/Taipei

WORKDIR /
ADD https://raw.githubusercontent.com/weichuntsai0217/xserver/master/setup-xclient.sh /
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y /google-chrome-stable_current_amd64.deb
