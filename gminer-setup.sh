#!/bin/bash
#gminer_cortex="Gminer gminer cortex cortex ctxc.2miners.com:2222 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

read -p "Enter the service name [$2-$3]: " serviceName
serviceName=${serviceName:-$2-$3}
read -p "Enter the pool [$5]: " poolServer
poolServer=${poolServer:-$5}
read -p "Please enter the walletID [$6]: " wallet
wallet=${wallet:-$6}
read -p "Enter your rig name [ViveLeQuebec]: " name
name=${name:-ViveLeQuebec}
read -p "port [4067]: " ipBind
ipBind=${ipBind:-4067}


isDual=${7}
fileName=/usr/bin/minerUtils/$serviceName.sh
if [[ ${isDual} == "dual" ]];
then
	echo ${isDual}
	read -p "Enter the second pool [$9]: " poolServer2
	poolServer2=${poolServer2:-$9}
	read -p "Please enter the second walletID [$7]: " wallet2
	wallet2=${wallet2:-$10}
	read -p "Enter your rig second name [ViveLeQuebec]: " name2
	name2=${name2:-ViveLeQuebec}


	echo "#!/bin/bash
	/usr/bin/$2/miner --algo $4 --server $poolServer --user $wallet.$name --api $ipBind --dalgo $9 --dserver $poolServer2 --duser $wallet2.$name2" > $fileName
else

	echo "#!/bin/bash
	/usr/bin/$2/miner --algo $4 --server $poolServer --user $wallet.$name --api $ipBind" > $fileName

fi

chmod +x $fileName
./service.sh $serviceName $1 $3
systemctl daemon-reload
