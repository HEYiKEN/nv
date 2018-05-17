#!/bin/bash
echo "Updating miners for nvOC V0019-2.x"
echo "Stopping miner and watchdog to reduce errors"
pkill -f 5watcdog
pkill -e screen
sleep 1
echo ""
sudo -- sh -c 'sudo apt install rar -y'

echo ""
mkdir -p /home/m1/Downloads/miners
cd /home/m1/Downloads/miners

echo "Ken Checking Equihash DSTM zm_miner 0.6.1"
if [ ! $(cat /home/m1/zec/zm/latest/version | grep 0.6.1) ]
then
  echo "Ken Downloading and making changes for DSTM ZM miner 0.6.1"
  mkdir -p /home/m1/zec/zm/latest
  wget -O- https://www.dropbox.com/s/8btnhba9b3wjhuw/DSTM_0.6.1.tar.gz | tar -xzC /home/m1/zec/zm/latest/ --strip 1
  chmod a+x /home/m1/zec/zm/latest/zm_miner
else
  echo "Ken DSTM zm miner is v0.6.1"
fi

echo""
echo""
echo "Downloading and checking new miners for nvOC-v0019-2.x finished"
echo""
echo""
sleep 2
echo " Restarting miner"
pkill -f 3main