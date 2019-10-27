FROM python:3.7

RUN pip3 install pipenv

RUN mkdir -p /tmp/deploy
ADD deploy-master/deploy2.sh /tmp/deploy

ENV TEMP_DIR=/tmp/deploy
ENV WORK_DIR=/htdocs/www
ENV GITHUB_ACCESS_TOKEN=
ENV GITHUB_OWNER=
ENV GITHUB_REPO=

ENTRYPOINT ["/tmp/deploy/deploy.sh"]
