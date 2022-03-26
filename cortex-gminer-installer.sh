#!/bin/bash

read -p "Please enter the walletID [0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b]: " wallet
wallet=${wallet:-0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b}
read -p "Enter your rig name [ViveLeQuebec]: " name
name=${name:-ViveLeQuebec}

read -p "port [4067]: " ipBind
ipBind=${ipBind:-4067}

rm -r /usr/bin/gminer
wget https://github.com/develsoftware/GMinerRelease/releases/download/2.90/gminer_2_90_linux64.tar.xz
mkdir /usr/bin/gminer
tar -xf gminer_2_90_linux64.tar.xz -C /usr/bin/gminer
sudo echo "#!/bin/bash
/usr/bin/gminer/miner --algo cortex --server ctxc.2miners.com:2222 --user $wallet.$name --api $ipBind
" > /usr/bin/cortex-gminer.sh
chmod +x /usr/bin/cortex-gminer.sh


sudo echo "
[Unit]
Description=CORTEX Gminer Script

[Service]
ExecStart=/usr/bin/cortex-gminer.sh

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/cortex-gminer.service

sudo systemctl daemon-reload

sudo systemctl enable cortex-gminer.service
