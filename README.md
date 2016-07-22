Dockerize Build Environment
===========================


A Docker build environment for automating "Dockerize" builds: "pack up your dynamically linked ELF binaries and all their dependencies and turn them into a Docker image."

This is just a wrapper around the EXCELLENT [Dockerize](https://github.com/larsks/dockerize) tool written by [Lars Kellogg-Stedman](https://github.com/larsks), to provide a mock-like build environment for installing dependencies and configuring the binaries before building the mini-images.

* This is still a work in progress. *

# Run Examples #

Run with a bash shell to install and configure interactively: 

    docker run -v <path to docker socket>:<path to docker socket> \
               -v /tmp:/tmp \
               -it dockerize

Run automatically to Dockerize a binary easily installable in base image \(eg: wget\) :

    docker run -v <path to docker socket>:<path to docker socket> \
               -v /tmp:/tmp \
               -it dockerize -c 'yum install -y sed && dockerize -t wget /usr/bin/wget'


TODO
====

See Issues.



