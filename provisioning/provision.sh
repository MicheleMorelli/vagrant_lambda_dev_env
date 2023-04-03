#! /usr/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zip unzip lynx tree

apt install python3.10-venv

mkdir -p ${HOME_DIR}/bin
chown vagrant:vagrant ${HOME_DIR}/bin
