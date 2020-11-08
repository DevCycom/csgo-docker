#! /bin/sh
#
# Automate naming the image for a SteamCMD Docker server

GAME=`grep 'ENV USER=' Dockerfile | perl -pe 's/(?:ENV USER=)(\w*).*$/$1/'`
VERSION=`grep 'LABEL version=' Dockerfile | perl -pe 's/(?:LABEL version=")((\d|-)+)".*$/$1/'`
IMG=cycom/${GAME}

docker build --rm -t ${IMG}:${VERSION} -t ${IMG}:latest .
