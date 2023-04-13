# Vagrant AWS Lambda dev env

A very simple dev environment for AWS lambda using Vagrant.

I created this while playing around with the latest version of SAM (mostly to avoid conflicts with existing installations).


## SAM 
The latest version of `sam-cli` is installed in the VM.

In the guest, it is possible to use the following command to mock the API Gateway (using SAM) locally so that it is forwarded correctly to the host on port 3000:
```
lambda
```

It will be then possible to get the results from the API in the host, eg:
```
curl localhost:3000/my_function
```

## Localstack
The VM uses the Localstack docker container via the `localstack` command (installed in the virtual environment via `pip`).

Some commands to work with Localstack on the VM:

```
# starting Localstack
localstack start

# starting Localstack in the background:
localstack start -d

# Checking the localstack logs (when Localstack is running in the background):
log
```

### Using `awslocal` and `samlocal` with Localstack
To speed local development up, the following 2 packages are installed via `pip`:
- `awslocal`
- `samlocal`

They just offer a simplified method to run aws-cli commands without having to specify the localstack's host name with every command.

For instance:
```
awslocal s3 mb s3://just-a-test-bucket
```
will create the `just-a-test-bucket` in Localstack (if it is running, of course :-)):
```
awslocal s3 ls
# 2023-04-13 13:49:30 just-a-test-bucket
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

## Some Gotchas

> **Note**:
> Vagrant/Virtualbox does not work well with symlinks (for security reasons).
> Instead of allowing symlinks to VB, I decided to simply create a virtual env
> in the guest VM, which gets activated once the session starts (`~/VM_VENV/bin/activate`)
> is run via the `bashrc`)
>
> Therefore, you will need to install the dependencies in your VM by using something like:
```
python3 -m pip install -r path/to/requirements.txt
```

If you are editing your code in an IDE in your host, you will need to create a virtual 
environment on the host, or pass the VM's interpreter via SSH if your IDE allows to do so (eg Pycharm and Intellij do). 

> **Warning**:
> The `venv` created on the host does not work on the guest and vice-versa (due to
> the symlinks issue with VB).

It is advisable to always using virtual environments when using Python.

One way to enforce this is to ensure that the following local env is set to true:
```
PIP_REQUIRE_VIRTUALENV
```


> **Note**:
> At the time of writing, SAM and AWS Lambda fully support Python 3.9, but not
> 3.10. Therefore, I used the deadsnakes PPA to download Python 3.9. This should be updated once Python 3.10 will be updated.
