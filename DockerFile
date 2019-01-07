FROM ubuntu:bionic
LABEL Diogo Dias saidogoid2@gmail.com

RUN apt-get update && apt-get upgrade -y && apt-get install -y sudo \
	nano \
	git \
	zip \
	unzip \
	vim \
	wget \
	curl \
	net-tools \
	ssh \
	&& apt-get update && apt-get upgrade -y \
	&& apt-get install -y \
	build-essential \
	software-properties-common \
	language-pack-en \
	python-setuptools \
	dialog apt-utils \
	python-pip \
	&& update-locale LANG=en_US.UTF-8 \
	&& useradd -ms /bin/bash ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


USER ubuntu
WORKDIR /home/ubuntu

### ONLY FOR CONNECT THROUGH SSH
#ADD ./sshd_config /etc/ssh/sshd_config
#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile 

EXPOSE 80 22 443 8080

CMD /bin/bash


