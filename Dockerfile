FROM archlinux

RUN echo "Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
# RUN echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm

RUN pacman -S git texlive-most texlive-lang perl-yaml-tiny perl-file-homedir perl-unicode-linebreak make gnu-free-fonts --noconfirm

RUN curl -fsSL https://gist.githubusercontent.com/b01/0a16b6645ab7921b0910603dfb85e4fb/raw/5186ea07a06eac28937fd914a9c8f9ce077a978e/download-vs-code-server.sh | sh

RUN code --install-extension mathematic.vscode-latex tomoki1207.pdf

WORKDIR /root/data

CMD [ "/bin/bash" ]
