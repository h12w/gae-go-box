#!/bin/sh
set -e
set -x

# common

DOWNLOAD="curl -OL"
sudo apt-get update -qq


# Go environment

GO_VER=1.3
GO_ZIP=go$GO_VER.linux-amd64.tar.gz
GO_URL=http://golang.org/dl/$GO_ZIP

export GOROOT=$HOME/go-dist
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

$DOWNLOAD $GO_URL
tar -C $HOME -xzf $GO_ZIP
rm $GO_ZIP
mv $HOME/go $GOROOT
mkdir -p $GOPATH/{src,pkg,bin}

sudo apt-get install mercurial -y -qq
sudo apt-get install git -y -qq
sudo apt-get install bzr -y -qq
sudo apt-get install subversion -y -qq


# App Engine (Go)

sudo apt-get install unzip -y -qq

GAE_VER=1.9.7
GAE_ZIP=go_appengine_sdk_linux_amd64-$GAE_VER.zip
GAE_URL=https://storage.googleapis.com/appengine-sdks/featured/$GAE_ZIP
GAE_SDK=go_appengine
export PATH=$PATH:$GAE_SDK

$DOWNLOAD $GAE_URL
unzip -q $GAE_ZIP
rm $GAE_ZIP
