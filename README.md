# Vagrant AWS Lambda dev env

A very simple dev environment for AWS lambda using Vagrant.

I created this while playing around with the latest version of SAM (mostly to avoid conflicts with existing installations).

In the guest, it is possible to use the following command to mock the API Gateway locally so that it is forwarded correctly to the host on port 3000:
```
lambda
```

It will be then possible to get the results from the API in the host, eg:
```
curl localhost:3000/my_function
```

## Before you run the machine
Set up the following environment variables:

```
# This is the directory that will be shared with the guest VM (this will be where
you store store the code of your Lambdas)

VAGRANT_LAMBDA_SHARED_DIR
``` 

## To install and run the VM

Then:
```
vagrant up
vagrant ssh
```

Enjoy!
