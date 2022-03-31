#!/bin/bash

rm -r /usr/bin/trex
wget https://github.com/trexminer/T-Rex/releases/download/0.25.9/t-rex-0.25.9-linux.tar.gz
mkdir /usr/bin/trex
tar -xf t-rex-0.25.9-linux.tar.gz -C /usr/bin/trex
rm t-rex-0.25.9-linux.tar.gz
