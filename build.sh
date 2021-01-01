#!/bin/sh

DOCKER_BUILDKIT=1 docker build -t enelar/grive2 .
docker push enelar/grive2