#!/bin/bash
source input.sh

software_options=(   "Gminer"  "TREX"  "LOL MINER" )
file=(   "gminer"  "trex"  "lolminer" )
gminer="aeternity cortex etc eth eth_ton eth_zil eth_zil_shardpool ravencoin ton zelcash"
trex="ergo eth cortex firo" 
lolminer="eth cortex" 

software_selection=( "false"      "false"      "false"    )
preselection2=( "false"      "false"      "false"    )

gminer_aeternity="Gminer gminer aeternity aeternity ae.2miners.com:4040 ak_v4cBSQhjh8gc49XMmrt1ELXJDA8U7sDZVKhLJiAzjPymVFgFQ"
gminer_etc="Gminer gminer ethash ethash etc.2miners.com:1010 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"
gminer_eth="Gminer gminer ethash ethash etc.2miners.com:2020 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"
gminer_cortex="Gminer gminer cortex cortex ctxc.2miners.com:2222 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"


trex_eth="Trex trex ethash ethash stratum+tcp://us-solo-eth.2miners.com:6060 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"


trex_ergo="TRex trex ergo"
setup_ergo="ERGO autolykos2"
ergo="stratum+tcp://erg.2miners.com:8888 9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7" 


setup_ravencoin="RAVENCOIN ravencoin Gminer gminer kawpow" 
ravencoin="rvn.2miners.com:6060 RF6v2uPzxFry9ZyMwmMH16GkUFhtj9tNTu" 


trex_firo="TRex trex firopow"
setup_firo="FIRO firo"
firo="stratum+tcp://firo.2miners.com:8181 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b" 


setup_ton="TON ton Gminer gminer ton" 
ton="wss://eu1.stratum.ton-pool.com/stratum 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b" 

setup_eth_ton="ETH+TON eth_ton Gminer gminer ethash"
eth_ton="eth.2miners.com:2020 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b dual wss://eu1.stratum.ton-pool.com/stratum 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

setup_zelcash="TON ton Gminer gminer 125_4" 
zelcash="zel.2miners.com:9090 t1NKFhdtaeazcgDWXaMCCVG3k2exkLp9R31" 

printf "\n"
echo -e "\e[34m***************************************************************"
echo -e "***************************************************************"
echo -e "***  \e[1mWelcome!\e[0m\e[34m                                               ***"
echo -e "***                                                         ***"
echo -e "***  Choose your sofware to be install!                     ***"
echo -e "***************************************************************"
echo -e "***************************************************************\e[0m"
printf "\n"
multiselect result software_options software_selection

bold=$(tput bold)

idx=0

mkdir -p /usr/bin/minerUtils
for option in "${file[@]}"; do
    if [[ ${result[idx]} == true ]]; then 
    	
    	#install software
    	sudo ./software/${option}.sh;
    	
    	software=${option}
    	selectedSoftwareCrypto=(${!software})
    	#stringArray=($sentence)
    	printf $selectedSoftwareCrypto
    	printf "\n"
	echo -e "\e[34m***************************************************************\e[0m"
	echo -e "\e[34m***************************************************************\e[0m"
	echo -e "${bold}Setup $software"
	echo -e "\e[34m***************************************************************\e[0m"
	echo -e "\e[34m***************************************************************\e[0m"
	echo -e "Choose your coin :"
	printf "\n"
    	
        multiselect selectedCrypto selectedSoftwareCrypto preselection2
     	printf "\n"
     	idx2=0
     	for crypto in "${selectedSoftwareCrypto[@]}"; do
     	   if [[ ${selectedCrypto[idx2]} == true ]]; then 	
     	
     		it="setup_"${crypto}
     		cryptoSetup=(${software}"_"${crypto})
     		#stringArray2=($cryptoSetup)
     		
     		
     		# it2=${software}"_"${crypto}
     		# sentence4="${!it2}"
     	
     	
     		# sentence3="${!it}"
     		# stringArray2=($sentence3)
     		# echo "Setup ${stringArray2[0]} with ${software}"
     		# echo "***************************************************************"
     		sudo ./${software}-setup.sh ${!cryptoSetup}
     		# printf "\n"
     	    #     printf "\n"
     	
     	   fi
     
     	    ((idx2++))
     	done
     	
    	echo "***************************************************************"
    	echo "***************************************************************"
      	echo "Setup done!"
       
    fi
    ((idx++))
done
