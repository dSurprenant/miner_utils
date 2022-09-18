#!/bin/bash

rm -r /usr/bin/bzminer
wget https://www.bzminer.com/downloads/bzminer_v11.1.0_linux.tar.gz
mkdir /usr/bin/bzminer
tar -xf bzminer_v11.1.0_linux.tar.gz -C /usr/bin/trex
rm bzminer_v11.1.0_linux.tar.gz
