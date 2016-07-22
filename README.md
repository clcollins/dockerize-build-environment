Dockerize Build Environment
===========================


A Docker build environment for automating "Dockerize" builds: "pack up your dynamically linked ELF binaries and all their dependencies and turn them into a Docker image."

This is just a wrapper around the EXCELLENT [Dockerize](https://github.com/larsks/dockerize) tool written by [Lars Kellogg-Stedman](https://github.com/larsks), to provide a mock-like build environment for installing dependencies and configuring the binaries before building the mini-images.

*This is still a work in progress.*

## Why? ##

Automation and flexibility.

The end goal is to be able to make use of a Docker container for building and configuring the binaries that will be "Dockerized" into their own image, to allow for flexibility in choice of environments.  Binaries and supporting config options can be built in the manner of a CentOS/Yum distribution, or an Ubuntu/Deb distribution easily - whatever base you wish to choose.  The Docker container offers a sandbox environment so the host machine doesn't need to have the packages installed, and using a Docker container to build the Docker images can help to automate builds.

## Run Examples ##

Run with a bash shell to install and configure interactively: 

    docker run -v <path to docker socket>:<path to docker socket> \
               -v /tmp:/tmp \
               -it dockerize

Run automatically to Dockerize a binary easily installable in base image \(eg: wget\) :

    docker run -v <path to docker socket>:<path to docker socket> \
               -v /tmp:/tmp \
               -it dockerize -c 'yum install -y sed && dockerize -t wget /usr/bin/wget'


## TODO ##

[See Issues](https://github.com/clcollins/dockerize-build-environment/issues)



