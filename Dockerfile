#Puppetmaster 4 Dockerfile

FROM debian:jessie
MAINTAINER pisterrassa@gmail.com

RUN apt-get update && apt-get install -y wget
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && \
	dpkg -i puppetlabs-release-pc1-jessie.deb

RUN apt-get update && apt-get install -y \
	puppetserver \
	ntp \	
&& rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/puppetlabs/bin:$PATH

#VOLUME ["/opt/puppetlabs"]

EXPOSE 8140

ENTRYPOINT puppetserver foreground
