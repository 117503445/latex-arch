FROM archlinux

# RUN echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

RUN wget -O /etc/pacman.d/mirrorlist.backup https://www.archlinux.org/mirrorlist/all/ && rankmirrors -n 6 mirrorlist.backup > mirrorlist

RUN pacman -Syyu --noconfirm

RUN pacman -S texlive-most texlive-lang perl-yaml-tiny perl-file-homedir perl-unicode-linebreak --noconfirm

WORKDIR /data

ENTRYPOINT [ "/bin/bash" ]