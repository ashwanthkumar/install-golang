#!/bin/bash
GO_VERSION="${GO_VERSION:-1.6}"
GO_BASE_PATH="/usr/local"
GOROOT="/usr/local/go"
rm -rf ${GOROOT}
curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar -xzf - -C ${GO_BASE_PATH}
ln -s ${GO_BASE_PATH}/go/bin/go /usr/bin/
ln -s ${GO_BASE_PATH}/go/bin/gofmt /usr/bin/
ln -s ${GO_BASE_PATH}/go/bin/godoc /usr/bin/

# Install Glide dependency mgmt tool
curl -sSL https://github.com/Masterminds/glide/releases/download/0.9.1/glide-0.9.1-linux-amd64.tar.gz | tar -xzf - -C /tmp/
chmod +x /tmp/linux-amd64/glide
sudo cp /tmp/linux-amd64/glide /usr/bin/

