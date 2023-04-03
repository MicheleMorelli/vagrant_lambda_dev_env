# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

SHARED_FOLDER=ENV['VAGRANT_LAMBDA_SHARED_DIR']

HOME_DIR= "/home/vagrant"
PROVISION_DIR="./provisioning"
CONFIG_DIR="./config"
UTILITY_DIR="./utility"
SAM_URL="https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip"
SAM_ZIP_FILE="aws-sam-cli-linux-x86_64.zip"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder SHARED_FOLDER, "#{HOME_DIR}/src"

  config.vm.provision "shell",
    path: "#{PROVISION_DIR}/provision.sh",
    env: {
      "HOME_DIR" => HOME_DIR
    },
    privileged: true 

  config.vm.provision :docker
  
  config.vm.provision "shell",
    path: "#{PROVISION_DIR}/install_sam.sh",
    env: {
      "SAM_ZIP_FILE" => SAM_ZIP_FILE,
      "HOME_DIR" => HOME_DIR,
      "SAM_URL" => SAM_URL
    },
    privileged: false 
  
  config.vm.provision "shell",
    path: "#{PROVISION_DIR}/python_env_prep.sh",
    env: {
      "HOME_DIR" => HOME_DIR
    },
    privileged: false 
  
  config.vm.provision "file", source: UTILITY_DIR, destination: "#{HOME_DIR}/bin"
  config.vm.provision "file", source: "#{CONFIG_DIR}/bashrc", destination: "#{HOME_DIR}/.bashrc"
  config.vm.provision "file", source: "#{CONFIG_DIR}/vimrc", destination: "#{HOME_DIR}/.vimrc"
  config.vm.provision "file", source: "#{CONFIG_DIR}/profile", destination: "#{HOME_DIR}/.profile"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "lambda_playground"
    vb.memory = "4096"
    vb.cpus = 2
  end
  

end
