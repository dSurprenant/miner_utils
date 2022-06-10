#!/bin/bash

#$1 = Label Crypto
#$2 = script Crypto
#$3 = Label Software
#$4 = script Software

sudo echo "
[Unit]
Description=$2 $3 Script

[Service]
ExecStart=/usr/bin/minerUtils/$1.sh

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/$1.service

sudo systemctl daemon-reload

#sudo systemctl enable cortex-gminer.service
