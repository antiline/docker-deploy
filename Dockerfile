FROM ubuntu:18.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt update && apt upgrade -y \
    && apt install -y make curl jq \
    && apt install -y python3 python3-pip python3-dev \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv

ADD deploy.sh /htdocs/deploy/deploy.sh

ENV TEMP_DIR=/tmp/deploy
ENV WORK_DIR=/htdocs/www
ENV GITHUB_ACCESS_TOKEN=
ENV GITHUB_OWNER=
ENV GITHUB_REPO=

ENTRYPOINT ["/htdocs/deploy/deploy.sh"]
