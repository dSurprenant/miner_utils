#!/bin/bash
# include class header
. obj.h
. system.h
source input.sh

defaultAddress=""

rigName=""
# defaultAddress = "0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

# obj raven 
# raven.algo="kawpow"
# raven.name="ravencoin"
# raven.adress=defaultAddress

# obj eth 
# eth.algo="ethash"
# eth.name="eth"
# eth.adress=defaultAddress


zel="zel 125_4"
zel+=" zel.2miners.com:9090"
zel+=" ${defaultAddress}"
zel+=" ${rigName}"

etc="etherumC etchash"
etc+=" etc.2miners.com:1010"
etc+=" ${defaultAddress}"
etc+=" ${rigName}"


eth="etherum ethash"
eth+=" eth.2miners.com:2020"
eth+=" ${defaultAddress}"
eth+=" ${rigName}"



ravencoin="ravencoin kawpow"
ravencoin+=" rvn.2miners.com:6060"
ravencoin+=" ${defaultAddress}"
ravencoin+=" ${rigName}"

cortex="cortex cortex"
cortex+=" ctxc.2miners.com:2222"
cortex+=" ${defaultAddress}"
cortex+=" ${rigName}"


kaspa="kaspa kaspa"
kaspa+=" pool.ca.woolypooly.com:3112"
kaspa+=" ${defaultAddress}"
kaspa+=" ${rigName}"

radiant="radiant radiant"
radiant+=" pool.ca.woolypooly.com:3122"
radiant+=" ${defaultAddress}"
radiant+=" ${rigName}"

nexa="nexa nexa"
nexa+=" pool.ca.woolypooly.com:3124"
nexa+=" ${defaultAddress}"
nexa+=" ${rigName}"

software_options=(   "Gminer"  "TREX"  "LOL MINER", "BZMiner" )
file=(   "gminer"  "trex"  "lolminer", "bzminer" )
gminer="cortex etc eth ravencoin zel"
trex="ergo eth cortex firo" 
bzminer="raven kaspa radiant nexa" 
lolminer="eth cortex" 

software_selection=( "false"      "false"      "false"    )
preselection2=( "false"      "false"      "false"    )

# gminer_aeternity="Gminer gminer aeternity aeternity ae.2miners.com:4040 ak_v4cBSQhjh8gc49XMmrt1ELXJDA8U7sDZVKhLJiAzjPymVFgFQ"
# gminer_etc="Gminer gminer ethash ethash etc.2miners.com:1010 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"
# gminer_eth="Gminer gminer ethash ethash etc.2miners.com:2020 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"
# gminer_cortex="Gminer gminer cortex cortex ctxc.2miners.com:2222 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"
# gminer_ravencoin="Gminer gminer ravencoin ravencoin ctxc.2miners.com:2222 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

# trex_eth="Trex trex ethash ethash stratum+tcp://us-solo-eth.2miners.com:6060 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"


# trex_ergo="TRex trex ergo"
# setup_ergo="ERGO autolykos2"
# ergo="stratum+tcp://erg.2miners.com:8888 9hjzUgDdzCzJGTnSkbREuRrXyCp3VDqzxnebrEjb7vYLJUY2yU7" 


# setup_ravencoin="RAVENCOIN ravencoin Gminer gminer kawpow" 
# ravencoin="rvn.2miners.com:6060 RF6v2uPzxFry9ZyMwmMH16GkUFhtj9tNTu" 


# trex_firo="TRex trex firopow"
# setup_firo="FIRO firo"
# firo="stratum+tcp://firo.2miners.com:8181 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b" 


# setup_ton="TON ton Gminer gminer ton" 
# ton="wss://eu1.stratum.ton-pool.com/stratum 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b" 

# setup_eth_ton="ETH+TON eth_ton Gminer gminer ethash"
# eth_ton="eth.2miners.com:2020 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b dual wss://eu1.stratum.ton-pool.com/stratum 0x825e53fcb57d2caa791ebf0bb4c2a64773ee1f1b"

# setup_zelcash="TON ton Gminer gminer 125_4" 
# zelcash="zel.2miners.com:9090 t1NKFhdtaeazcgDWXaMCCVG3k2exkLp9R31" 

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
    	if [$1 == true]; then
			#install software
			sudo ./software/${option}.sh;
    	fi
    	software=${option}
    	selectedSoftwareCrypto=(${!software})
    	#stringArray=($sentence)
    
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
     		cryptoSetup=(${crypto})
     		sudo ./${software}-setup.sh ${!cryptoSetup}
     	   fi
     
     	    ((idx2++))
     	done
     	
    	echo "***************************************************************"
    	echo "***************************************************************"
      	echo "Setup done!"
       
    fi
    ((idx++))
done
