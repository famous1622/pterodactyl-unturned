FROM ubuntu:latest

MAINTAINER Isaac A, <isaac@isaacs.site>

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt upgrade -y && \
    apt install -y lib32gcc1 lib32stdc++6 curl unzip libmono-cil-dev mono-runtime lib32gcc1 lib32stdc++6 libglu1-mesa libxcursor1 libxrandr2 libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
