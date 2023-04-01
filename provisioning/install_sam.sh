! /usr/bin/bash

# Installing SAM CLI
cd $HOME_DIR
wget $SAM_URL
unzip $SAM_ZIP_FILE -d sam-installation
sudo ./sam-installation/install
sam --version
echo "Deleting $SAM_ZIP_FILE from $HOME_DIR..."
rm $SAM_ZIP_FILE
