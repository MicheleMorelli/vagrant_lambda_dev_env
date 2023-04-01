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

## To install and run the VM

Set the `SHARED_FOLDER` value in the `Vagrantfile` to where you keep your Lambda-related code.
Then:
```
vagrant up
vagrant ssh
```

Enjoy!
