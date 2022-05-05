# latex-arch

LaTeX Docker image based on Arch Linux. 

Nightly build based on Github Action.

## pull image

`docker pull 117503445/latex-arch`

Chinese user can set docker registry mirrors, refer to <https://wiki.117503445.top/op/Docker%20%E5%B8%B8%E7%94%A8%E6%93%8D%E4%BD%9C/>.

You can also pull directly from Alibaba Cloud Container Registry, but the image may be out of date. Remember to modify the image name of follow commands.

`docker pull registry.cn-hangzhou.aliyuncs.com/docker1175/latex-arch`

## quick start

```sh
# Change to your project
cd my_latex_project

# run 'latexmk' command
docker run -it --rm -v ${PWD}:/root/data 117503445/latex-arch latexmk

# run 'xelatex main.tex' command
docker run -it --rm -v ${PWD}:/root/data 117503445/latex-arch xelatex main.tex

# optional: custom font
# https://github.com/note286/xduugtp#gnulinux to get fonts
docker run -it --rm -v ${PWD}:/root/data -v ${PWD}/fonts:/usr/share/fonts 117503445/latex-arch latexmk
```

## VS Code (recommend)

1. run LaTeX Docker Container

```sh
# Change to your project
cd my_latex_project

docker run -d -it -v ${PWD}:/root/data -v ${PWD}/fonts:/usr/share/fonts 117503445/latex-arch
```

2. VS Code install Docker extension <https://code.visualstudio.com/docs/containers/overview>

3. Attach VS Code

![attach](assets/attach.png)

4. install [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=james-yu.latex-workshop) extension in Docker Container. In fact, these extensions have been installed in docker image.

5. Enjoy :)
