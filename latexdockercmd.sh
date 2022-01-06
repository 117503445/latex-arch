#!/bin/sh
IMAGE=dockershelf/latex:full
exec docker run -w /data --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
