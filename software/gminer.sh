#!/bin/bash

rm -r /usr/bin/gminer
wget https://github.com/develsoftware/GMinerRelease/releases/download/2.99/gminer_2_99_linux64.tar.xz
mkdir /usr/bin/gminer
tar -xf gminer_2_99_linux64.tar.xz -C /usr/bin/gminer
rm gminer_2_99_linux64.tar.xz
