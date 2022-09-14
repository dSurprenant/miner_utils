# EZ-MinerSetup

This script install selected miners software with all proper configurations as services.


Need git to be installed.

# Get code from repo
    git clone https://github.com/dSurprenant/miner_utils.git

# Installation

    cd ./ez-miner-setup
    sudo ./installer.sh

## Setup miner software

Choose between all software currently available. 

The selected one will be installed at this location :

    /usr/bin/***  
  *** =<br>
   Gminer / gminer<br>T-Rex  /  tex<br>lolMiner / lolminer<br>
   
### Gminer
#### Setup currency for gminer:
##### select the currency that you want to setup with gminer
 - aeternity 
 - cortex
 - etc 
 - eth
 - eth_ton
 - eth_zil
 - eth_zil_shardpool
 - ravencoin
 - ton
 - zelcash

##### For each selected currency, you will need to setup the appropriate information:
	
| Question | exemple|
|--|--|
| Enter the pool | `ae.2miners.com:4040` |
| Please enter the walletID |  `ak_v4cBSQhjh8gc49XMmrt1ELXJDA8U7sDZVKhLJiAzjPymVFgFQ` |
| Enter your rig name| `ViveLeQuebec` |
| Enter the port for webview| `4067` |
##### To run the service : 

`sudo systemctl start ******-gminer.service`<br>`sudo systemctl status ******-gminer.service`<br>`sudo systemctl stop ******-gminer.service`

****** = Installed crypto

### T-Rex
##### Supported crypto

 - cortex 
 - eth 
 - firo

### lolMiner
##### Supported crypto

 - cortex 
 - eth

# Desinstallation

## Delete a file

To be done
