#!/bin/bash

set -e -x

# Install go toolchain
GO_BINARY="/usr/bin/go"
GO_VERSION="${GO_VERSION:-1.6}"
GO_BASE_PATH="/usr/local"
GOROOT="/usr/local/go"
if [ ! -L ${GO_BINARY} ] || [ ! -e ${GO_BINARY} ]; then
  rm -rf ${GOROOT}
  curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -xzf - -C ${GO_BASE_PATH}
  for BINARY in `ls ${GO_BASE_PATH}/go/bin`
  do
    ln -s ${GO_BASE_PATH}/go/bin/${BINARY} /usr/bin/
  done
fi

# Install Glide dependency mgmt tool
GLIDE_BINARY="/usr/bin/glide"
if [ ! -L ${GLIDE_BINARY} ] || [ ! -e ${GLIDE_BINARY} ]; then
  curl -sSL https://github.com/Masterminds/glide/releases/download/0.9.1/glide-0.9.1-linux-amd64.tar.gz | tar -xzf - -C /tmp/
  chmod +x /tmp/linux-amd64/glide
  mv /tmp/linux-amd64/glide /usr/bin/
fi
