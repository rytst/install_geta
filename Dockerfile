FROM ubuntu:22.04

WORKDIR /usr/local/geta

COPY ./install_soft.sh .

RUN apt-get update && apt-get install -y \
    wget \
    lsb-release

RUN chmod 755 ./install_soft.sh && ./install_soft.sh

CMD ["sleep", "infinity"]
