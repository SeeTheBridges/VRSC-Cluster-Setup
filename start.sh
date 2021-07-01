#!/bin/bash
cd

# First we'll build our verus miner from source
sudo apt-get update
sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
sudo apt-get install clang lld -y
git clone https://github.com/DevTechGames/ccminer-rk3328.git
cd ccminer-rk3328
chmod +x build.sh
chmod +x configure.sh
chmod +x autogen.sh
./build.sh

# Then we'll copy it to the root directory to make my easy start script more universal
cp ccminer ~/

# Next we'll build our Monero Ocean miner as a backup
cd
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
git clone https://github.com/MoneroOcean/xmrig.git
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)

cp xmrig ~/

cd
