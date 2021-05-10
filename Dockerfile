FROM python:3.8.7-alpine@sha256:fddd3a0eeb324352838c2a53451d9c489159a9d0da3d8fa75bc301073159b8a0

LABEL maintainer="DigiKlausur project H-BRS <mohammad.wasil@h-brs.de>"

RUN apk add --no-cache git
RUN apk add --update alpine-sdk

RUN addgroup -g 1000 jovyan
RUN adduser -D -G jovyan -u 1000 jovyan

RUN mkdir /tmp/e2x-docs
COPY . /tmp/e2x-docs
RUN cd /tmp/e2x-docs && pip3 install -r requirements.txt
RUN rm -rf /tmp/e2x-docs

USER jovyan
