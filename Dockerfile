FROM ubuntu:18.04

RUN apt update && apt upgrade -y \
    && apt install -y make curl jq \
    && apt install -y python3 python3-pip python3-dev \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv

RUN mkdir -p /tmp/deploy
ADD deploy.sh /tmp/deploy

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV TEMP_DIR=/tmp/deploy
ENV WORK_DIR=/htdocs/www

ENTRYPOINT ["/tmp/deploy/deploy.sh"]
