FROM phusion/baseimage

CMD ["/sbin/my_init"]

# Environment Variables 
RUN echo xterm-256color > /etc/container_environment/TERM
RUN echo /root > /etc/container_environment/HOME
RUN echo /root > /etc/container_environment/HOME
RUN locale-gen zh_TW.UTF-8
RUN echo zh_TW.UTF-8 > /etc/container_environment/LC_ALL
RUN echo zh_TW.UTF-8 > /etc/container_environment/LC_CTYPE

# apt-fast
RUN add-apt-repository --yes ppa:apt-fast/stable \
&& apt-get update \
&& apt-get -y install apt-fast \

# apt-get 
&& apt-fast update \
&& apt-fast -y upgrade \
&& apt-fast -y dist-upgrade \

&& apt-fast install -y 	vim \
						powerline \
						git \
						curl \
						gdebi \
						tmux \
						cmake \
						clipit \
						python-pip \
						python3-pip \
						python-dev \
						libffi-dev \
						build-essential \
						virtualenvwrapper \
						nodejs \
						npm \
						default-jre \
						default-jdk \

&& pip install --upgrade virtualenv \

&& apt-fast -y install --fix-missing \
&& apt-fast -y autoremove \
&& apt-fast -y autoclean
