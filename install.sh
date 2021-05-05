#!/bin/bash

IMAGE_NAME=sytedev/avr-toolchain
TOOLCHAIN_SCRIPT=avr-toolchain

docker pull ${IMAGE_NAME}:latest

cat <<EOF > /tmp/${TOOLCHAIN_SCRIPT}.tmp
#!/bin/bash

docker run --rm -u 1000:1000 --privileged -v \$(pwd):/build ${IMAGE_NAME} "\$@"
EOF

chmod ugo+x /tmp/${TOOLCHAIN_SCRIPT}.tmp
sudo mv /tmp/${TOOLCHAIN_SCRIPT}.tmp /usr/bin/${TOOLCHAIN_SCRIPT}
