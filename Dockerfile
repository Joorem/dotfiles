FROM ubuntu:20.10
LABEL description="A simple docker image to test my dotfiles"
LABEL maintainer="jerome@joworld.net"
LABEL name="joorem-dotfiles"
LABEL url="https://github.com/Joorem/dotfiles"
LABEL version="1.0"

ENV TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive
ARG deps_build="curl gcc python3-dev"
ARG deps_run="bash bat exuberant-ctags fd-find fzf git nodejs npm python3 tree vim zsh"
ARG url_lsd="https://github.com/Peltoche/lsd/releases/download/0.19.0/lsd_0.19.0_amd64.deb"
ARG url_starship="https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"

# Update APT cache
RUN apt-get -qq update

# Configure locales
RUN apt-get -qq -y install locales
RUN locale-gen --purge en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install available packages
RUN apt-get -qq -y upgrade
RUN apt-get -qq -y install $deps_build $deps_run

# Download lsd and starship binaries
RUN curl --location --silent $url_starship --output -|tar --extract --directory /usr/local/bin/ --gzip --file -
RUN curl --location --silent $url_lsd --output lsd_0.19.0_amd64.deb && dpkg -i lsd_0.19.0_amd64.deb && rm lsd_0.19.0_amd64.deb

# Configure alternatives
RUN update-alternatives --install /usr/bin/bat bat /usr/bin/batcat 1
RUN update-alternatives --install /usr/bin/fd fd /usr/bin/fdfind 1

# Copy this repository in /mnt
ADD . /mnt/

# install dotfiles
RUN cd /mnt && bash install.sh
RUN vim -E -s -u ~/.vimrc +PlugInstall +qall; echo

# remove unnecessary packages
RUN apt-get -qq -y purge $build_deps
RUN apt-get -qq -y autoremove
RUN apt-get clean
