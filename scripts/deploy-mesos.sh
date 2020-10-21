#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=========================Downloading Mesos================================================================"
# Download the latest stable release from Apache
# export VAGRANT_CURRENT_VERSION="1.10.0"
# wget http://www.apache.org/dist/mesos/1.10.0/mesos-1.10.0.tar.gz
wget http://www.apache.org/dist/mesos/1.10.0/mesos-1.10.0.tar.gz
tar -zxf mesos-1.10.0.tar.gz

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

echo "=========================Building Mesos (Posix)================================================================"
# Change working directory.
cd mesos

# Bootstrap (Only required if building from git repository).
./bootstrap

# Configure and build.
mkdir build
cd build
../configure
make
echo "========================================================================================="