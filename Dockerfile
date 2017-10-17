FROM docker:stable-git

ARG PROJECT
ARG DESCRIPTION
ARG MAINTAINER
ARG URL
ARG DATE
ARG COMMIT
LABEL "org.label-schema.name"=$PROJECT
LABEL "org.label-schema.build-date"=$DATE
LABEL "org.label-schema.maintainer"=$MAINTAINER
LABEL "org.label-schema.description"=$DESCRIPTION
LABEL "org.label-schema.vcs-url"=$URL
LABEL "org.label-schema.commit-sha"=$COMMIT

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base libffi-dev
ENV RUBY_PACKAGES ruby ruby-bundler ruby-dev
RUN apk add --no-cache $BUILD_PACKAGES  &&\
    apk add --no-cache $RUBY_PACKAGES   &&\
    gem install inspec --no-ri --no-rdoc

RUN  apk add --no-cache ca-certificates openssl       &&\
     update-ca-certificates

RUN mkdir /project
WORKDIR /project
