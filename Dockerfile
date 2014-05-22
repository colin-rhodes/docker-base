#
# Base Dockerfile
# Installs some basic requirements for services running under ubuntu
#

FROM ubuntu:14.04

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN \
	apt-get -yq update && \
 	apt-get -yq dist-upgrade && \
	apt-get -yq install ca-certificates openssl software-properties-common

CMD ["/bin/bash"]