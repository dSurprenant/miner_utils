#!/bin/bash

read -p "Enter the pool [$6]: " poolServer
poolServer=${poolServer:-$6}
read -p "Please enter the walletID [$7]: " wallet
wallet=${wallet:-$7}
read -p "Enter your rig name [ViveLeQuebec]: " name
name=${name:-ViveLeQuebec}
read -p "port [4067]: " ipBind
ipBind=${ipBind:-4067}

isDual=${8}
fileName=/usr/bin/minerUtils/$2-$4.sh
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
	/usr/bin/$4/miner --algo $5 --server $poolServer --user $wallet.$name --api $ipBind --dalgo $9 --dserver $poolServer2 --duser $wallet2.$name2" > $fileName
else

	echo "#!/bin/bash
	/usr/bin/$4/miner --algo $5 --server $poolServer --user $wallet.$name --api $ipBind" > $fileName

fi
chmod +x $fileName
./service.sh $1 $2 $3 $4  
systemctl daemon-reload
