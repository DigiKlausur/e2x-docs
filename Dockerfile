FROM python:3.8.7-alpine@sha256:fddd3a0eeb324352838c2a53451d9c489159a9d0da3d8fa75bc301073159b8a0

LABEL maintainer="DigiKlausur project H-BRS <mohammad.wasil@h-brs.de>"

RUN apk add --no-cache git
RUN apk add --update alpine-sdk

RUN addgroup -g 1000 jovyan
RUN adduser -D -G jovyan -u 1000 jovyan

WORKDIR /home/jovyan

RUN pip3 install sphinx \
    && pip3 install sphinx-autobuild

# Create cronjob to reload the source every 6 hour
ADD pull_repository.cronjob /opt/git/pull_repository.cronjob
RUN chmod 0644 /opt/git/pull_repository.cronjob && \
    crontab /opt/git/pull_repository.cronjob
RUN touch /var/log/cron.log

#RUN git clone https://github.com/DigiKlausur/e2x-docs
USER root
RUN mkdir /home/jovyan/e2x-docs
COPY . /home/jovyan/e2x-docs
RUN chown jovyan:jovyan -R /home/jovyan/e2x-docs
RUN cd /home/jovyan/e2x-docs && pip3 install -r requirements.txt

#RUN cd /home/jovyan/e2x-docs/docs && make html

# Expose the live build using sphinx-autobuild
CMD sphinx-autobuild -b html --host 0.0.0.0 --port 80 /home/jovyan/e2x-docs/docs/source /home/jovyan/e2x-docs/docs/build &&\
    (cron -f &) && tail -f /var/log/cron.log

USER jovyan
