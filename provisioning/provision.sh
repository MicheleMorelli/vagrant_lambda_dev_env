#! /usr/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zip unzip lynx tree nodejs npm


# Installing the version of Python that is supported by AWS Lambda
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt-get install ${PYTHON_VERSION} -y

# Allowing the use of venv
sudo apt install -y ${PYTHON_VERSION}-venv


mkdir -p ${HOME_DIR}/bin
chown vagrant:vagrant ${HOME_DIR}/bin
