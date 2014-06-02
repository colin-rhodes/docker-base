#
# Base Dockerfile
# Installs some basic requirements for services running under ubuntu
#

FROM ubuntu:14.04

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

ADD sources.list /etc/apt/sources.list

RUN umask 0022;echo 'APT::Install-Recommends "0";' | \
    tee /etc/apt/apt.conf.d/00DisableInstallRecommends

RUN \
	apt-get -yq update && \
 	apt-get -yq upgrade && \
	apt-get -yq install socat && \
	apt-get -yq autoremove && \
	apt-get -yq clean && \
	apt-get -yq autoclean
