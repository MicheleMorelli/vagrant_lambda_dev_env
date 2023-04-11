#! /usr/bin/bash

docker pull localstack/localstack

source ~/VM_VENV/bin/activate
which python3
python3 -m pip install awscli-local[ver1]
python3 -m pip install aws-sam-cli-local
