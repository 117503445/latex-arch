FROM archlinux

RUN echo "Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
# RUN echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm

RUN pacman -S git texlive-most texlive-lang perl-yaml-tiny perl-file-homedir perl-unicode-linebreak make gnu-free-fonts --noconfirm

COPY download-vs-code-server.sh download-vs-code-server.sh

RUN ./download-vs-code-server.sh

WORKDIR /root/data

CMD [ "/bin/bash" ]
