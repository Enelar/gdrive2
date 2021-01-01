#!/bin/sh

DOCKER_BUILDKIT=1 docker build -t enelar/gdrive2 .
docker push enelar/gdrive2

DOCKER_BUILDKIT=1 docker build -t enelar/gdrive2:man -f=Dockerfile-man .
docker push enelar/gdrive2:man