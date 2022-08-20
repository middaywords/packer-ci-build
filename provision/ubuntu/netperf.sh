#!/bin/bash

set -xe

sudo apt-get update
sudo apt-get update && apt-get install -y --allow-downgrades \
    automake build-essential gcc

# Till https://github.com/HewlettPackard/netperf/pull/46 merged
git clone --depth 1 https://github.com/sayboras/netperf.git $HOME/n
cd $HOME/n/
./autogen.sh
./configure --prefix=/usr
ln -s /bin/true /usr/bin/makeinfo
make
make install
cd -
rm -rf $HOME/n/

git clone --depth 1 https://github.com/cilium/netperf.git $HOME/n
chmod a+x $HOME/n/super_netperf
cp $HOME/n/super_netperf /usr/bin/
rm -rf $HOME/n/
