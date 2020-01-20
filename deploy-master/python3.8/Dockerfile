FROM python:3.8

RUN pip3 install pipenv

RUN mkdir -p /deploy
ADD deploy-master.sh /deploy

ENV TEMP_DIR=/deploy/tmp
ENV WORK_DIR=/htdocs/www
ENV GITHUB_ACCESS_TOKEN=
ENV GITHUB_OWNER=
ENV GITHUB_REPO=

ENTRYPOINT ["/deploy/deploy-master.sh"]
