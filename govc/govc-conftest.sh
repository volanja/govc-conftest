#!/usr/bin/env bash

# govc-conftest allows for testing resources in your cluster using Open Policy Agent
# It uses the conftest utility and expects to find associated policy files in
# a directory called policy

# Check if a specified command exists on the path and is executable
function check_command () {
    if ! [[ -x $(command -v "$1") ]] ; then
        echo "$1 not installed"
        exit 1
    fi
}

function usage () {
cat <<- EOS
A govc plugin for using Conftest to test objects in VMware vSphere using Open Policy Agent

See below site for more information
   https://github.com/open-policy-agent/conftest
   https://github.com/vmware/govmomi/tree/master/govc

Usage:
   conftest govc [command] (NAME)

Available Commands:
  about       show vSphere informaion
  *.info      show information
  *.ls        show list

  NOTICE:
    High-impact operations is not support. e.g.: *.add, *.remove, *.destory and so on.

OPTION:
  NAME        specify target

govc Flags:
  flags is not supported.
EOS
}

# e.g. govc datacenter.info
function run_with_one_argument () {
    echo "Testing $1"
    if output=$(govc "$1" --json); then
        echo "$output" | conftest test -
    fi
}

# e.g. govc vm.info --json CentOS8
function run_with_two_argument () {
    echo "Testing $1 $2"
    if output=$(govc "$1" --json $2); then
        echo "$output" | conftest test -
    fi
}

# Check the required commands are available on the PATH
check_command "govc"
check_command "conftest"

if [[ ($# -eq 0) || ($# -gt 2 )|| ($1 == "--help") || ($1 == "-h") ]]; then
    # No commands or many option or the --help flag passed and we'll show the usage instructions
    usage
    exit 1
fi

# *.ls , *.info
if [[ $1 =~ ^about$ || $1 =~ ^[a-z\.]+\.ls$ || $1 =~ ^[a-z\.]+\.info$ ]]; then
  if [[ ($# -eq 1) ]]; then
    # If we have one argument then we assume govc command.
    run_with_one_argument $1
  elif [[ ($# -eq 2) ]]; then
    # If we have two argument then we assume govc command with target.
    run_with_two_argument $1 $2
  fi
else
    echo "Please check the arguments to govc conftest"
    echo
    usage
    exit 1
fi
