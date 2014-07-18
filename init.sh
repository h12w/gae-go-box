#!/bin/sh
set -e
set -x

# common

DOWNLOAD="curl -OL"
sudo apt-get update
echo $(pwd)
echo $HOME
ls $HOME
ls
source $HOME/gae-go-env.inc

# Go environment

GO_VER=1.3
GO_ZIP=go$GO_VER.linux-amd64.tar.gz
GO_URL=http://golang.org/dl/$GO_ZIP

$DOWNLOAD $GO_URL
tar -C $HOME -xzf $GO_ZIP
rm $GO_ZIP
mv $HOME/go $GOROOT
mkdir -p $GOPATH/{src,pkg,bin}

sudo apt-get install mercurial -y
sudo apt-get install git -y
sudo apt-get install bzr -y
sudo apt-get install subversion -y


# App Engine (Go)

sudo apt-get install unzip -y

GAE_VER=1.9.7
GAE_ZIP=go_appengine_sdk_linux_amd64-$GAE_VER.zip
GAE_URL=https://storage.googleapis.com/appengine-sdks/featured/$GAE_ZIP

$DOWNLOAD $GAE_URL
unzip -q $GAE_ZIP
rm $GAE_ZIP
