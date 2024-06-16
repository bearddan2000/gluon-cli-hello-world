FROM rust:1.73.0-slim-bookworm

ENV GLUON_VERSION 0.18.2

RUN apt-get update && \
    apt-get install -y git && \
    cargo install gluon_repl@$GLUON_VERSION && \
    apt-get remove -y git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY bin .

CMD "./run.sh"