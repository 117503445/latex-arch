FROM archlinux

# RUN echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
RUN echo "Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm

RUN pacman -S git texlive-most texlive-lang perl-yaml-tiny perl-file-homedir perl-unicode-linebreak --noconfirm

WORKDIR /root/data

CMD [ "/bin/bash" ]
