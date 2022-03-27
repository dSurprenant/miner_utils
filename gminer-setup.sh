#!/bin/bash

read -p "Enter the pool [$6]: " poolServer
poolServer=${poolServer:-$6}
read -p "Please enter the walletID [$7]: " wallet
wallet=${wallet:-$7}
read -p "Enter your rig name [ViveLeQuebec]: " name
name=${name:-ViveLeQuebec}

read -p "port [4067]: " ipBind
ipBind=${ipBind:-4067}

sudo ./software/$4.sh

sudo echo "#!/bin/bash
/usr/bin/$4/miner --algo $5 --server $poolServer --user $wallet.$name --api $ipBind
" > /usr/bin/$2-$4.sh
chmod +x /usr/bin/$2-$4.sh

sudo ./service.sh $1 $2 $3 $4  

sudo systemctl daemon-reload
