#!/bin/bash

read -p "Please enter the walletID [9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7]: " wallet
wallet=${wallet:-9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7}
read -p "Enter your rig name [0]: " name
name=${name:-0}

read -p "IP local + port [10.0.0.140:4067]: " ipBind
ipBind=${ipBind:-10.0.0.140:4067}

/trex.sh

sudo echo "#!/bin/bash
/usr/bin/t-rex/t-rex -a autolykos2 -o stratum+tcp://erg.2miners.com:8888 -u $wallet.$name -w $name --api-bind-http $ipBind
" > /usr/bin/ergo-trex.sh
chmod +x /usr/bin/ergo-trex.sh

/service.sh ERGO ergo T-Rex trex  

sudo systemctl daemon-reload

#sudo systemctl enable ergo-trex.service

