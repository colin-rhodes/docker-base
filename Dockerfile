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

RUN apt-get autoremove
RUN apt-get install sudo

CMD ["/bin/bash"]