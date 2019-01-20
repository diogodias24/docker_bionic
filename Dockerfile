FROM ubuntu:bionic
LABEL Diogo Dias saidogoid2@gmail.com

# set a health check
#HEALTHCHECK --interval=5s \
#            --timeout=5s \
#            CMD curl -f http://127.0.0.1:80 || exit 1

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	sudo \
	nano \
	git \
	zip \
	unzip \
	vim \
	wget \
	curl \
	net-tools \
	ssh \
	build-essential \
	software-properties-common \
	language-pack-en \
	python-setuptools \
	dialog apt-utils \
	python-pip \
	&& update-locale LANG=en_US.UTF-8 \
	&& apt-get autoremove -y \
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


