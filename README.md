# govc-conftest

govc-conftest is a [Conftest](https://github.com/open-policy-agent/conftest) plugin for using govc to test objects in VMware vSphere using Open Policy Agent.

# Installing a plugin

```
conftest plugin install https://github.com/volanja/govc-conftest
```

# Using plugin

if you check datacenter.info, you type `datacenter.info`

```
conftest govc datacenter.info
```

# Examples

see `examples` folder.

# Question

## `conftest govc` says specify an ESX or vCenter URL"

```
$ conftest govc datacenter.info
govc: specify an ESX or vCenter URL
```

You should set env. See the examples below for details.

```
export GOVC_URL=https://<username>:<password>@<ip address>/sdk
export GOVC_INSECURE=1
```

# Uninstall

```
$ rm -rf  ~/.conftest/plugins/govc
```

