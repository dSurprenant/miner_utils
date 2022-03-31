#!/bin/bash
rm -r /usr/bin/lolminer
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.47/lolMiner_v1.47_Lin64.tar.gz
mkdir /usr/bin/lolminer
tar -xf lolMiner_v1.47_Lin64.tar.gz -C /usr/bin/lolminer
rm lolMiner_v1.47_Lin64.tar.gz
