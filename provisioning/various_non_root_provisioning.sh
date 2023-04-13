#! /usr/bin/bash

<<'###INTRO'
This provisioning script runs commands as the non-root default user.
###INTRO


VENV_NAME="VM_VENV"

echo "Installing SAM CLI..."
cd $HOME_DIR
wget $SAM_URL
unzip $SAM_ZIP_FILE -d sam-installation
sudo ./sam-installation/install
sam --version
echo "Deleting $SAM_ZIP_FILE from $HOME_DIR..."
rm $SAM_ZIP_FILE


echo "Creating the Python virtual environment using ${PYTHON_VERSION}"
cd $HOME_DIR
$PYTHON_VERSION -m venv ${VENV_NAME}


echo "Preparing the localstack environment..."
docker pull localstack/localstack
source ~/${VENV_NAME}/bin/activate
which python3
python3 -m pip install awscli-local[ver1] aws-sam-cli-local localstack


echo "Installing Serverless..."
sudo npm install -g serverless
npm install serverless-offline --save-dev
npm install serverless-localstack --save-dev
