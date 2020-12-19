FROM ubuntu:20.10
LABEL description="A simple docker image to test my dotfiles"
LABEL maintainer="jerome@joworld.net"
LABEL name="joorem-dotfiles"
LABEL url="https://github.com/Joorem/dotfiles"
LABEL version="1.0"

ENV TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive
ARG deps_build="curl gcc libllvm11 python3-dev"
ARG deps_run="bash bat exuberant-ctags fd-find fzf git nodejs npm python3 tree vim zsh"
ARG url_lsd="https://github.com/Peltoche/lsd/releases/download/0.19.0/lsd_0.19.0_amd64.deb"
ARG url_starship="https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
ARG opt_apt="--no-install-recommends -qq --yes"
ARG opt_curl="--location --silent"
ARG ver_lsd="0.19.0"

# Update APT cache
RUN apt-get -qq update

# Configure locales
RUN apt-get $opt_apt install locales
RUN locale-gen --purge en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install available packages
RUN apt-get $opt_apt install $deps_build $deps_run

# Download lsd and starship binaries
RUN curl $opt_curl $url_starship --output -|tar --extract --directory /usr/local/bin/ --gzip --file -
RUN curl $opt_curl $url_lsd --output lsd_${ver_lsd}_amd64.deb && dpkg -i lsd_${ver_lsd}_amd64.deb && rm lsd_${ver_lsd}_amd64.deb

# Configure alternatives
RUN update-alternatives --install /usr/bin/bat bat /usr/bin/batcat 1
RUN update-alternatives --install /usr/bin/fd fd /usr/bin/fdfind 1

# Copy this repository in /mnt
WORKDIR /mnt
COPY . .

# install dotfiles
RUN bash install.sh
RUN vim -E -s -u ~/.vimrc +PlugInstall +qall; echo

# remove unnecessary packages
RUN apt-get -qq -y purge $deps_build
RUN apt-get -qq -y autoremove
RUN apt-get clean && rm -rf /var/lib/apt/lists/
