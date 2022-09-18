#!/bin/bash
#gminer_cortex="Gminer gminer cortex cortex ctxc.2miners.com:2222 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

read -p "Enter the service name [$1]: " serviceName
serviceName=${serviceName:-$1}
read -p "Enter the pool [$3]: " poolServer
poolServer=${poolServer:-$3}
read -p "Please enter the walletID [$4]: " wallet
wallet=${wallet:-$4}
read -p "Enter your rig name [$5]: " name
name=${name:-$5}
read -p "port [4067]: " ipBind
ipBind=${ipBind:-4067}

read -p "Other Args: " otherARGS
otherARGS=${otherARGS:-}

isDual=${7}
fileName=/usr/bin/minerUtils/$serviceName.sh


	echo "#!/bin/bash
	/usr/bin/$1/miner --algo $2 --server $poolServer --user $wallet.$name --api $ipBind $otherARGS" > $fileName


chmod +x $fileName
./service.sh $serviceName $1 $3
systemctl daemon-reload
