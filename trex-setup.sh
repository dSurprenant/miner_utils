#!/bin/bash

read -p "Enter the service name [$2-$3]: " serviceName
serviceName=${serviceName:-$2-$3}
read -p "Enter the pool [$5]: " poolServer
poolServer=${poolServer:-$5}
read -p "Please enter the walletID [$6]: " wallet
wallet=${wallet:-$6}
read -p "Enter your rig name [0]: " name
name=${name:-0}

read -p "IP local + port [10.0.0.140:4067]: " ipBind
ipBind=${ipBind:-10.0.0.140:4067}



sudo echo "#!/bin/bash
/usr/bin/$2/t-rex -a $4 -o $poolServer -u $wallet.$name -w $name --api-bind-http $ipBind
" > /usr/bin/minerUtils/$serviceName.sh
chmod +x /usr/bin/minerUtils/$serviceName.sh
sudo ./service.sh $serviceName $1 $3  
sudo systemctl daemon-reload

#sudo systemctl enable ergo-trex.service

