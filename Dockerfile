FROM python:3.12-alpine

LABEL "com.github.actions.name"="DigitalOcean Space Sync"
LABEL "com.github.actions.description"="Sync a directory to an DigitalOcean Space"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1.0"
LABEL repository="https://github.com/idlefingers/do-space-sync-action"
LABEL homepage="https://damientimewell.com"
LABEL maintainer="Damien Timewell <hello@damientimewell.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.33.31'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
