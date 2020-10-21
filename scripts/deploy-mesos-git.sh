#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=========================System Requirements================================================================"

# Ubuntu 16.04
# Update the packages.
apt-get update -qq

# Install a few utility tools.
apt-get install -yqq tar wget git

# Install the latest OpenJDK.
apt-get install -yqq openjdk-8-jdk

# Install autotools (Only necessary if building from git repository).
apt-get install -yqq autoconf libtool

# Install other Mesos dependencies.
apt-get install -yqq build-essential python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping

echo "=========================Downloading Mesos================================================================"
# Clone the Mesos git repository (Advanced Users Only)
git clone https://gitbox.apache.org/repos/asf/mesos.git

echo "=========================Building Mesos (Posix)================================================================"
# Change working directory.
cd mesos

# Bootstrap (Only required if building from git repository).
./bootstrap

# Configure and build.
mkdir build
cd build
../configure
# make
echo "========================================================================================="