#!/bin/bash

read -p "Please enter the walletID [9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7]: " wallet
wallet=${wallet:-9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7}
read -p "Enter your rig name [0]: " name
name=${name:-0}

read -p "IP local + port [10.0.0.140:4067]: " ipBind
ipBind=${ipBind:-10.0.0.140:4067}

rm -r /usr/bin/t-rex
wget https://github.com/trexminer/T-Rex/releases/download/0.25.9/t-rex-0.25.9-linux.tar.gz
mkdir /usr/bin/t-rex
tar -xf t-rex-0.25.9-linux.tar.gz -C /usr/bin/t-rex
sudo echo "#!/bin/bash
/usr/bin/t-rex/t-rex -a autolykos2 -o stratum+tcp://erg.2miners.com:8888 -u $wallet.$name -w $name --api-bind-http $ipBind
" > /usr/bin/ergo-trex.sh
chmod +x /usr/bin/ergo-trex.sh


sudo echo "
[Unit]
Description=ERGO T-Rex Script

[Service]
ExecStart=/usr/bin/ergo-trex.sh

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/ergo-trex.service

sudo systemctl daemon-reload

#sudo systemctl enable ergo-trex.service

