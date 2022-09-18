#!/bin/bash

read -p "Enter the service name [$1]: " serviceName
serviceName=${serviceName:-$1}
read -p "Enter the pool [$3]: " poolServer
poolServer=${poolServer:-$3}
read -p "Please enter the walletID [$4]: " wallet
wallet=${wallet:-$4}
read -p "Enter your rig name [$5]: " name
name=${name:-$5}

read -p "IP local + port [10.0.0.140:4067]: " ipBind
ipBind=${ipBind:-10.0.0.140:4067}
read -p "Other Args: " otherARGS
otherARGS=${otherARGS:-}


sudo echo "#!/bin/bash
/usr/bin/$1/bzminer -a $2 -p stratum+tcp://$poolServer -w $wallet.$name $otherARGS
" > /usr/bin/minerUtils/$serviceName.sh
chmod +x /usr/bin/minerUtils/$serviceName.sh
sudo ./service.sh $serviceName $1 $3  
sudo systemctl daemon-reload

#sudo systemctl enable ergo-trex.service

