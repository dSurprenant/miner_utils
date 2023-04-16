#!/bin/bash

rm -r /usr/bin/bzminer
wget https://www.bzminer.com/downloads/bzminer_v14.1.1_linux.tar.gz
mkdir /usr/bin/bzminer
tar -xf bzminer_v14.1.1_linux.tar.gz --strip-components=1 -C /usr/bin/bzminer
rm bzminer_v14.1.1_linux.tar.gz
