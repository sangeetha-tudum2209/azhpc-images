#!/bin/bash
set -ex

source /etc/profile

# Set the GCC version
export GCC_VERSION=$(jq -r '.gcc."'"$DISTRIBUTION"'".version' <<< $COMPONENT_VERSIONS)
spack env activate /opt/gcc-$GCC_VERSION
export GCC_HOME=$(spack location -i gcc@$GCC_VERSION)

$COMMON_DIR/install_amd_libs.sh