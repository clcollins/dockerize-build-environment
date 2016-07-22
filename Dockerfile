FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

#RUN if [[ -z DOCKER_VERSION ]] ; then echo 'Please specify the $DOCKER_VERSION variable using --build-args during the Docker build' ; else echo "Building with Docker version $DOCKER_VERSION" ; fi

ENV DOCKER_VERSION 1.8.2
ENV DOCKERIZE "https://github.com/larsks/dockerize.git"
ENV PACKAGES "git python-setuptools python-jinja2"

ADD usage.sh /usage.sh
RUN curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} -o /usr/bin/docker \
    && chmod +x /usr/bin/docker \
    && chmod +x /usage.sh \
    && yum install -y $PACKAGES \
    && yum clean all

RUN git clone $DOCKERIZE /dockerize \
    && pushd /dockerize \
    && python /dockerize/setup.py install \
    && popd

ENTRYPOINT [ 'bash ' ]
