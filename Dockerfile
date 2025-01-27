FROM alpine:latest
LABEL author="Caravela Hacker Club"

RUN apk update && apk add --no-cache \
    git \
    git-lfs \
    nodejs \
    npm \
    && npm install -g --unsafe-perm \
    elm \
    elm-analyse \
    sass
