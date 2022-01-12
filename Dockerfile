FROM archlinux/archlinux:base-devel

# RUN echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
RUN echo "Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

# RUN wget -O /etc/pacman.d/mirrorlist.backup https://www.archlinux.org/mirrorlist/all/ && rankmirrors -n 6 mirrorlist.backup > mirrorlist

RUN pacman -Syyu --noconfirm

RUN pacman -S git texlive-most texlive-lang perl-yaml-tiny perl-file-homedir perl-unicode-linebreak zsh --noconfirm

# https://github.com/testcab/docker-yay/blob/master/Dockerfile
# makepkg user and workdir
ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay
  
RUN yay -S ttf-ms-win10-zh_cn

WORKDIR /data

ENTRYPOINT [ "/bin/zsh" ]
