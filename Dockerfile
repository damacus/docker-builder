FROM docker:stable-git

RUN apk add --no-cache bash curl \
                       curl-dev  libffi-dev      \
                       build-base      \
                       ca-certificates openssl   \
                       git ruby ruby-bundler     \
                       ruby-dev                  \
                       python3                 &&\
    mkdir -p /etc/ssl/certs/                   &&\
    echo "Updating CA Certs"                   &&\
    update-ca-certificates --fresh             &&\
    gem install inspec --no-ri --no-rdoc       &&\
    pip3 install --upgrade pip                 &&\
    mkdir /project

ENV GHR_VERSION="v0.10.0"    \
    COMPOSE_VERSION="1.21.2"

RUN curl -L -O https://github.com/tcnksm/ghr/releases/download/${GHR_VERSION}/ghr_${GHR_VERSION}_linux_amd64.tar.gz &&\
    tar -xvzf ghr_${GHR_VERSION}_linux_amd64.tar.gz                                                                 &&\
    mv ghr_${GHR_VERSION}_linux_amd64/ghr /usr/local/bin                                                            &&\
    rm -rf ghr_${GHR_VERSION}_linux_amd64 ghr_${GHR_VERSION}_linux_amd64.tar.gz                                     &&\
    hash ghr                                                                                                        &&\
    pip3 install --no-cache-dir docker-compose==${COMPOSE_VERSION}

WORKDIR /project

ARG PROJECT=unknown
ARG DATE=unknown
ARG DESCRIPTION=unknown
ARG URL=unknown
ARG COMMIT=unknown

LABEL "io.damacus.title"=$PROJECT            \
      "io.damacus.created"=$DATE             \
      "io.damacus.description"=$DESCRIPTION  \
      "io.damacus.url"=$URL                  \
      "io.damacus.revision"=$COMMIT
