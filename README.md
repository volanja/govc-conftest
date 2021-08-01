# govc-conftest

govc-conftest is a [Conftest](https://github.com/open-policy-agent/conftest) plugin for using govc to test objects in VMware vSphere using Open Policy Agent.

# Installing a plugin

```
conftest plugin install git://github.com/volanja/govc-conftest//govc
```

# Using plugin on Linux / Mac

If you check datacenter.info, you type `datacenter.info`

```
conftest govc datacenter.info
```

__Notice: Windows is not support.__

If you want to use govc on Windows like this plugin, you type below.

```
govc datacenter.info --json | conftest test -
```

# Examples

see [govc-conftest-policies](https://github.com/volanja/govc-conftest-policies)

# Question

## `conftest govc` says "specify an ESX or vCenter URL"

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

