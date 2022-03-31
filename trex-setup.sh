#!/bin/bash

read -p "Enter the pool [$6]: " poolServer
poolServer=${poolServer:-$6}
read -p "Please enter the walletID [$7]: " wallet
wallet=${wallet:-$7}
read -p "Enter your rig name [0]: " name
name=${name:-0}

read -p "IP local + port [10.0.0.140:4067]: " ipBind
ipBind=${ipBind:-10.0.0.140:4067}



sudo echo "#!/bin/bash
/usr/bin/$4/t-rex -a $5 -o $poolServer -u $wallet.$name -w $name --api-bind-http $ipBind
" > /usr/bin/minerUtils/$2-$4.sh
chmod +x /usr/bin/minerUtils/$2-$4.sh
sudo ./service.sh $1 $2 $3 $4  
sudo systemctl daemon-reload

#sudo systemctl enable ergo-trex.service

