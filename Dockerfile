#
# Base Dockerfile
# Installs some basic requirements for services running under ubuntu
#

FROM ubuntu:14.04

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

ENV SUDO_FORCE_REMOVE yes
RUN apt-get purge -yf sudo
RUN apt-get purge -yq $(dpkg-query -Wf '${Package;-40}${Priority}\n' | \
    awk '$2 ~ /optional|extra/ { print $1 }')

RUN umask 0022;echo 'APT::Install-Recommends "0";' | \
    tee /etc/apt/apt.conf.d/00DisableInstallRecommends
RUN apt-get -yq autoremove
RUN apt-get -yq update
RUN apt-get -yq upgrade
RUN apt-get -yq install sudo

CMD ["/bin/bash"]
