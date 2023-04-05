#! /usr/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zip unzip lynx tree


# We need to install Python 3/9 via the PPA because 3.10 is not yet supported by
# SAM and lambda functions
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt-get install python3.9 -y

# Allowing the use of venv
sudo apt install -y python3.10-venv
sudo apt install -y python3.9-venv

mkdir -p ${HOME_DIR}/bin
chown vagrant:vagrant ${HOME_DIR}/bin
