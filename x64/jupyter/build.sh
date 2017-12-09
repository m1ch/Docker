#!/bin/bash

# update base image
docker pull \
    ubuntu:vivid
# build image
docker build \
    --tag m1ch/jupyter \
    --tag m1ch/jupyter:latest \
    .
# create 'latest' tag for image
#docker tag \
#    -f m1ch/jupyter \
#    silvavlis/digikam:latest
