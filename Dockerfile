FROM phusion/baseimage

ENV TERM xterm-256color
ENV HOME /root

RUN locale-gen zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8
ENV LC_CTYPE zh_TW.UTF-8

CMD ["/sbin/my_init"]

# apt-fast
RUN add-apt-repository --yes ppa:apt-fast/stable \
&& apt-get update \
&& apt-get -y install apt-fast \

# apt-get 

&& apt-fast update \
&& apt-fast -y upgrade \
&& apt-fast -y dist-upgrade \

&& apt-fast install -y python-pip python3-pip python-dev libffi-dev build-essential virtualenvwrapper \
&& pip install --upgrade virtualenv \
&& apt-fast install -y vim powerline \
&& apt-fast install -y nodejs npm \
&& apt-fast install -y default-jre default-jdk \
&& apt-fast install -y git curl gdebi tmux cmake \
&& apt-fast install -y clipit \ 

&& apt-fast -y install --fix-missing \
&& apt-fast -y autoremove \
&& apt-fast -y autoclean

