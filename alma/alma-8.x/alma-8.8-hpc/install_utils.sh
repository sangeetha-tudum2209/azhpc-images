#!/bin/bash
set -ex

# Setup microsoft packages repository for moby
# Download the repository configuration package
curl https://packages.microsoft.com/config/rhel/8/prod.repo > ./microsoft-prod.repo
# Copy the generated list to the sources.list.d directory
cp ./microsoft-prod.repo /etc/yum.repos.d/

yum repolist

# Install Kernel dependencies
dnf install -y https://repo.almalinux.org/vault/8.8/BaseOS/x86_64/os/Packages/kernel-devel-$KERNEL.rpm \
    https://repo.almalinux.org/vault/8.8/BaseOS/x86_64/os/Packages/kernel-headers-$KERNEL.rpm \
    https://repo.almalinux.org/vault/8.8/BaseOS/x86_64/os/Packages/kernel-modules-extra-$KERNEL.rpm

../common/install_utils.sh