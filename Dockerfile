FROM node:8.11-slim
LABEL MAINTAINER Mofesola Babalola <me@mofesola.com>

################################################################################
## setup container
################################################################################

COPY docker/setup/* /tmp/
RUN /tmp/setup.sh

################################################################################
## setup application
################################################################################

RUN npm install -g s3-website @angular/cli

COPY . /deploy
RUN mv /deploy/.aws/credentials.tmpl ~/.aws/credentials.tmpl && rm -rf /deploy/.aws && rm /deploy/Dockerfile

WORKDIR /deploy
